class EventsController < ApplicationController
  before_filter :check_login, :only => :index

  def new
    @event = Event.new()
  end
  def create
    if params[:event][:period] == "Does not repeat"
      @event = Event.new(params[:event].merge!(:user => current_user))
    else
      #      @event_series = EventSeries.new(:frequency => params[:event][:frequency], :period => params[:event][:repeats], :starttime => params[:event][:starttime], :endtime => params[:event][:endtime], :all_day => params[:event][:all_day])
      @event_series = EventSeries.new(params[:event].merge!(:user => current_user)) 
    end
  end
  def index
   @var = params[:meetingroom]
  end
  def get_events
    if params[:id]
      @events = Event.find(:all,:conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}' and meeting_room = '#{params[:id]}'"])
    else    
      @events = Event.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}' "])
    end
    events = [] 
    @events.each do |event|
      events << {:id => event.id, :title => event.title,:username => event.user.first_name, :description => event.description || "Some cool description here...", :start => "#{event.starttime.iso8601}", :end => "#{event.endtime.iso8601}", :allDay => event.all_day,:meeting_room=>event.meeting_room, :recurring => (event.event_series_id)? true: false}
    end
    render :text => events.to_json
  end
  def move
    @event = Event.find_by_id params[:id]
    if @event
      @event.starttime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.starttime))
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.all_day = params[:all_day]
      @event.save
    end
  end
  def resize
    @event = Event.find_by_id params[:id]
    if @event
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.save
    end    
  end
  def edit
    @event = current_user.events.find_by_id(params[:id])
    if @event == nil
      flash[:error] = "This Is Other User Event You Only Access Your Own Event"
      render js: "window.location.reload(true)" and return false
    else
      @event = Event.find_by_id(params[:id])
      flash[:error] = 'Event Successfully Updated'
    end
  end
  def update
    @event = Event.find_by_id(params[:event][:id])
    if params[:event][:commit_button] == "Update All Occurrence"
      @events = @event.event_series.events #.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.update_events(@events, params[:event])
    elsif params[:event][:commit_button] == "Update All Following Occurrence"
      @events = @event.event_series.events.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.update_events(@events, params[:event])
    else
      @event.attributes = params[:event]
      @event.save
      render js: "window.location.reload(true)" and return false
    end
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')" 
    end
  end  
  def destroy
    @event = Event.find_by_id(params[:id])
    if params[:delete_all] == 'true'
      @event.event_series.destroy
    elsif params[:delete_all] == 'future'
      @events = @event.event_series.events.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.event_series.events.delete(@events)
    else
      @event.destroy
    end
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')"
    end
  end
end


class MeetingroomsController < ApplicationController
  before_filter :use_meetingroom, :only => [:index, :show, :new, :edit]
  # GET /meetingrooms
  # GET /meetingrooms.xml
  def index
    @meetingrooms = Meetingroom.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meetingrooms }
    end
  end
  # GET /meetingrooms/1
  # GET /meetingrooms/1.xml
  def show
    @meetingroom = Meetingroom.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meetingroom }
    end
  end
  # GET /meetingrooms/new
  # GET /meetingrooms/new.xml
  def new
    @meetingroom = Meetingroom.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meetingroom }
    end
  end
  # GET /meetingrooms/1/edit
  def edit
    @meetingroom = Meetingroom.find(params[:id])
  end
  # POST /meetingrooms
  # POST /meetingrooms.xml
  def create
    @meetingroom = Meetingroom.new(params[:meetingroom])
    respond_to do |format|
      if @meetingroom.save
        format.html { redirect_to(meetingrooms_path, flash[:error] => 'Meetingroom was successfully created.') }
        format.xml  { render :xml => @meetingroom, :status => :created, :location => @meetingroom }
      else
        flash.now[:error] = @meetingroom.errors.each_full {}.join('<br/>')
        format.html { render :action => "new" }
      end
    end
  end
  # PUT /meetingrooms/1
  # PUT /meetingrooms/1.xml
  def update
    @meetingroom = Meetingroom.find(params[:id])
    respond_to do |format|
      if @meetingroom.update_attributes(params[:meetingroom])
        format.html { redirect_to(meetingrooms_path, flash[:error] => 'Meetingroom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meetingroom.errors, :status => :unprocessable_entity }
      end
    end
  end
  # DELETE /meetingrooms/1
  # DELETE /meetingrooms/1.xml
  def destroy
    @meetingroom = Meetingroom.find(params[:id])
    @meetingroom.destroy
    respond_to do |format|
      format.html { redirect_to(meetingrooms_url) }
      format.xml  { head :ok }
    end
  end
  def collection
    @meetingroom_dropdown = Meetingroom.all.map{|i| "<option value='#{i.id}'>#{i.name}</option>"}.join
    render :json => @meetingroom_dropdown
  end
end


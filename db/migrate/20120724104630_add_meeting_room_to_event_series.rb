class AddMeetingRoomToEventSeries < ActiveRecord::Migration
  def self.up
    add_column :event_series, :meeting_room, :integer
  end

  def self.down
    remove_column :event_series, :meeting_room
  end
end

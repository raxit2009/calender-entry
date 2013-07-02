class AddMeetingRoomToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :meeting_room, :integer
  end

  def self.down
    remove_column :events, :meeting_room
  end
end

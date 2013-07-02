class CreateMeetingrooms < ActiveRecord::Migration
  def self.up
    create_table :meetingrooms do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :meetingrooms
  end
end

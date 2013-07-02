class AddUserIdToEventSeries < ActiveRecord::Migration
  def self.up
    add_column :event_series, :user_id, :integer
  end

  def self.down
    remove_column :event_series, :user_id
  end
end

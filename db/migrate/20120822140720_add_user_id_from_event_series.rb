class AddUserIdFromEventSeries < ActiveRecord::Migration
  def self.up
    add_column :event_series, :user_id, :string
  end

  def self.down
    remove_column :event_series, :user_id
  end
end

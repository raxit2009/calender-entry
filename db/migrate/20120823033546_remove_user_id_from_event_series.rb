class RemoveUserIdFromEventSeries < ActiveRecord::Migration
  def self.up
    remove_column :event_series, :user_id
  end

  def self.down
    add_column :event_series, :user_id, :string
  end
end

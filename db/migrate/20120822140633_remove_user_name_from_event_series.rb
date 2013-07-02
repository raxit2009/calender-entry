class RemoveUserNameFromEventSeries < ActiveRecord::Migration
  def self.up
    remove_column :event_series, :user_name
  end

  def self.down
    add_column :event_series, :user_name, :string
  end
end

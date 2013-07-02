class AddUserNameToEventSeries < ActiveRecord::Migration
  def self.up
    add_column :event_series, :user_name, :string
  end

  def self.down
    remove_column :event_series, :user_name
  end
end

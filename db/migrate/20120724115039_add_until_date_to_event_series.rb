class AddUntilDateToEventSeries < ActiveRecord::Migration
  def self.up
    add_column :event_series, :until, :datetime
  end

  def self.down
    remove_column :event_series, :until
  end
end

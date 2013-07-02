class AddUntilDateToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :until, :datetime
  end

  def self.down
    remove_column :events, :until
  end
end

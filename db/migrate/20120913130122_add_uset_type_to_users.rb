class AddUsetTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :uset_type, :boolean, :default => false
  end

  def self.down
    remove_column :users, :uset_type
  end
end

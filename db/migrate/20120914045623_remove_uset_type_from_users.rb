class RemoveUsetTypeFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :uset_type
  end

  def self.down
    add_column :users, :uset_type, :boolean
  end
end

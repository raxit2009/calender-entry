class RemoveUserNameFromEvent < ActiveRecord::Migration
  def self.up
    remove_column :events, :user_name
  end

  def self.down
    add_column :events, :user_name, :string
  end
end

class AddUserIdFromEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :user_id, :string
  end

  def self.down
    remove_column :events, :user_id
  end
end

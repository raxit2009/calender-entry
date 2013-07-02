class RemoveUserIdFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :user_id
  end

  def self.down
    add_column :events, :user_id, :string
  end
end

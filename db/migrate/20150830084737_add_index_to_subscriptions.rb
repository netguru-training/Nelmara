class AddIndexToSubscriptions < ActiveRecord::Migration
  def change
    add_index :subscriptions, [:tagname, :user_id], unique: true
  end
end

class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.boolean :b_read
      t.string :content
      t.string :imageurl
      t.string :notificationurl

      t.timestamps
    end
  end
end

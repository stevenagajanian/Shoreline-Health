class CreateDroplets < ActiveRecord::Migration
  def change
    create_table :droplets do |t|
      t.integer :user_id
      t.integer :page_id
      t.text :body_html
      t.text :body
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end

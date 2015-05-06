class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :conversation_id
      t.text :content
      t.boolean :b_read

      t.timestamps
    end
  end
end

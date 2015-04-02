class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.integer :user_id
      t.text :description
      t.date :date_occured

      t.timestamps
    end
  end
end

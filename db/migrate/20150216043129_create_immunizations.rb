class CreateImmunizations < ActiveRecord::Migration
  def change
    create_table :immunizations do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.boolean :b_validated

      t.timestamps
    end
  end
end

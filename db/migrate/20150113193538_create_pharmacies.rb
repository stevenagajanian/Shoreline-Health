class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.integer :user_id
      t.integer :medication_id
      t.string :name
      t.boolean :b_current

      t.timestamps
    end
  end
end

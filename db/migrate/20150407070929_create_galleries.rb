class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.integer :doctor_visit_id
      t.integer :post_id
      t.integer :symptom_id
      t.integer :lab_result

      t.timestamps
    end
  end
end

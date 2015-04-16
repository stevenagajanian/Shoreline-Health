class AddModelsIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :doctor_visit_id, :integer
    add_column :photos, :symptom_id, :integer
    add_column :photos, :medication_id, :integer
    add_column :photos, :immunization, :integer
    add_column :photos, :allergy, :integer
  end
end

class AddAuthorIdToModels < ActiveRecord::Migration
  def change
    add_column :symptoms, :author_id, :integer
    add_column :allergies, :author_id, :integer
    add_column :doctor_visits, :author_id, :integer
    add_column :immunizations, :author_id, :integer
    add_column :medications, :author_id, :integer
    add_column :treatments, :author_id, :integer
    add_column :diagnoses, :author_id, :integer
    add_column :conditions, :author_id, :integer
    add_column :appointments, :author_id, :integer
    add_column :galleries, :author_id, :integer
    add_column :photos, :author_id, :integer
  end
end

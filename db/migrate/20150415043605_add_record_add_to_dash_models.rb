class AddRecordAddToDashModels < ActiveRecord::Migration
  def change
    add_column :medications, :date_occured, :date
    add_column :conditions, :date_occured, :date
    add_column :allergies, :date_occured, :date
    add_column :doctor_visits, :date_occured, :date
    add_column :immunizations, :date_occured, :date
  end
end
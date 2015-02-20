class AddImmunizationDoseAndAge < ActiveRecord::Migration
  def change
    add_column :immunizations, :rec_age, :string
    add_column :immunizations, :rec_dose, :string
    add_column :immunizations, :date_taken, :date
  end
end

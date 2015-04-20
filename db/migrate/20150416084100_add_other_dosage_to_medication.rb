class AddOtherDosageToMedication < ActiveRecord::Migration
  def change
    add_column :medications, :other_dosage, :string
  end
end
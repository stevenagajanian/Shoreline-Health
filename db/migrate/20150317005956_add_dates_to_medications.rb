class AddDatesToMedications < ActiveRecord::Migration
  def change
    add_column :medications, :start_date, :date
    add_column :medications, :end_date, :date
    add_column :medications, :finished, :boolean
    add_column :medications, :prescribed_by, :string
    add_column :medications, :filled_by, :string
    add_column :medications, :notes, :string
  end
end

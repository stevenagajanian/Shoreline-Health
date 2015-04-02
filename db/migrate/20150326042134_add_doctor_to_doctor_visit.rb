class AddDoctorToDoctorVisit < ActiveRecord::Migration
  def change
    add_column :doctor_visits, :doctor, :string
  end
end

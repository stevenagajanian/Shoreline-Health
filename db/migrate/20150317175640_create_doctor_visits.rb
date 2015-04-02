class CreateDoctorVisits < ActiveRecord::Migration
  def change
    create_table :doctor_visits do |t|
      t.integer :user_id
      t.text :notes
      t.integer :doctor_id
      t.string :location
      t.string :reason
      t.integer :album_id

      t.timestamps
    end
  end
end

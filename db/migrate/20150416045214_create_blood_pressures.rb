class CreateBloodPressures < ActiveRecord::Migration
  def change
    create_table :blood_pressures do |t|
      t.integer :user_id
      t.integer :author_id
      t.integer :systolic
      t.integer :diastolic
      t.string :location

      t.timestamps
    end
  end
end

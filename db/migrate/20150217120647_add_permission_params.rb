class AddPermissionParams < ActiveRecord::Migration
  def change
    add_column :permissions, :b_write_access, :boolean
    add_column :permissions, :b_full_write_access, :boolean
    add_column :permissions, :b_full_view_access, :boolean
    add_column :permissions, :tracker_id, :integer
    add_column :permissions, :allergy_id, :integer
    add_column :permissions, :album_id, :integer
    add_column :permissions, :medication_id, :integer
  end
end

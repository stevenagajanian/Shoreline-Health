class AddUserBooleanLabels < ActiveRecord::Migration
  def change
    add_column :users, :b_use_btn_labels, :boolean
    add_column :users, :wallpaper_url, :string
    add_column :users, :b_use_wallpaper, :boolean
  end
end

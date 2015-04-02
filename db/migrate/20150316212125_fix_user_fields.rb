class FixUserFields < ActiveRecord::Migration
  def up
  #  remove_column :users, :date_of_birth
  #  remove_column :users, :bio
  ##  remove_column :users, :imageurl
  #  remove_column :users, :bloodtype
  #  remove_column :users, :phone
  end
  
  def down
   # add_column :users, :date_of_birth, :date
   # add_column :users, :bio, :text
   # add_column :users, :imageurl, :string
   # add_column :users, :bloodtype, :string
   # add_column :users, :phone, :string
   # add_column :users, :avatar, :string
  end
end

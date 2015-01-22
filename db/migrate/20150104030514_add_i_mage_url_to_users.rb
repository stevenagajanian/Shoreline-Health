class AddIMageUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :imageurl, :string
  end
end

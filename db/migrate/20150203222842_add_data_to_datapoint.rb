class AddDataToDatapoint < ActiveRecord::Migration
  def change
    add_column :datapoints, :user_id, :integer
    add_column :datapoints, :amount, :float
    add_column :datapoints, :data_name, :string
  end
end

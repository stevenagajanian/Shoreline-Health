class AddDataNameAndBarChartBoolToTracker < ActiveRecord::Migration
  def change
    add_column :trackers, :data_name, :string
  end
end

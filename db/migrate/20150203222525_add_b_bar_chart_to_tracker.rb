class AddBBarChartToTracker < ActiveRecord::Migration
  def change
    add_column :trackers, :b_bar_chart, :boolean
  end
end

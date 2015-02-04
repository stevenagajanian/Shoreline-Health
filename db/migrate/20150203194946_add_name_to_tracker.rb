class AddNameToTracker < ActiveRecord::Migration
  def change
    add_column :trackers, :name, :string
    add_column :trackers, :metric_id, :integer
  end
end

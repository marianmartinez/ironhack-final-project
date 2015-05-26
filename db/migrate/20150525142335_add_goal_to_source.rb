class AddGoalToSource < ActiveRecord::Migration
  def change
    add_column :sources, :goal_id, :integer
  end
end

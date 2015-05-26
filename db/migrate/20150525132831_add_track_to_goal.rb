class AddTrackToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :track_id, :integer
  end
end

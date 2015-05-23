class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.string :description
      t.datetime :goal_date
      t.integer :accomplished
      t.timestamps null: false
    end
  end
end

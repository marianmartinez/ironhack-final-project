class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :image
      t.string :kind
      t.timestamps null: false
    end
  end
end

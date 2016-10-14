class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.float :latitude
      t.float :longitude
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

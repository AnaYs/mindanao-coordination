class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :main_office
      t.text :area_of_work
      t.string :organisation
      t.float :latitude
      t.float :longitude
      t.references :program, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.string :main_office
      t.text :area_of_work
      t.string :organisation
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end

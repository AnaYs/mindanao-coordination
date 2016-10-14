class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :position
      t.string :phone
      t.string :email
      t.text :areas_of_work
      t.references :program, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

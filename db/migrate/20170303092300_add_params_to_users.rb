class AddParamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :expertise, :string
    add_column :users, :address, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :phone, :string
    add_column :users, :organisation, :string
  end
end

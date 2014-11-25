class AddCityToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :country, :string
    add_column :users, :city, :string
  end
end

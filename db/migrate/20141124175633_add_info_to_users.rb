class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :age, :integer
    add_column :users, :target_gender, :string
    add_column :users, :target_min_age, :integer
    add_column :users, :target_max_age, :integer
  end
end

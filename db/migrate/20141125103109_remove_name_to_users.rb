class RemoveNameToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :email, :string
    remove_column :users, :age, :integer
    remove_column :users, :gender, :string
  end
end

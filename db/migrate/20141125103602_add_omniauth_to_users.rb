class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :string
    add_column :users, :email, :string
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
  end
end

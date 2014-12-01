class AddTokenastextToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :token, :string
    add_column :users, :token, :text
  end
end

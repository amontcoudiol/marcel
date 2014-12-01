class AddFbaccesstockenastextToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :fb_access_token, :string
    add_column :users, :fb_access_token, :text
  end
end

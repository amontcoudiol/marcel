class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :voted_picture_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end

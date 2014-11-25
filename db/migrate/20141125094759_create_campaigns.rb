class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :picture_a_id
      t.integer :picture_b_id
      t.integer :user_id

      t.timestamps
    end
  end
end

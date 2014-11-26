class AddStatusColumnToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :status, :boolean, default: true
  end
end

class CampaignController < ApplicationController
skip_before_action :authenticate_user!

 def new
   @campaign = Campaign.new
 end

 def create
   @campaign = current_user.campaigns.new(campaign_params)
   @campaign.save
   redirect_to voting_path
 end

 def show
   @user = User.find(36) # to be replaced with current_user
   @campaign = @user.next_campaign
   @vote = Vote.new
 end

 private

 def campaign_params
   params.require(:campaign).permit(:picture_a_id, :picture_b_id, :user_id)
 end

end
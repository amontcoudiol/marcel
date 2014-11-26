class CampaignController < ApplicationController
 skip_before_action :authenticate_user!

 def show
  @user = User.find(36) # to be replaced with current_user
  @campaign = @user.next_campaign
 end

end
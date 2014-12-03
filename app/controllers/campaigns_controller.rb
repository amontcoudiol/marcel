class CampaignsController < ApplicationController
 skip_before_action :authenticate_user!

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    @campaign.save
    redirect_to next_votes_path
  end

  def show
    @user = current_user
    @campaign = Campaign.find(params[:id])
    if @campaign.votes.where(user: current_user).any? || !current_user.targets.include?(@campaign.user)
      redirect_to next_votes_path
    else
      @votes = @campaign.votes.new
    end
  end

  def finish
    @campaign.status = false
  end

  def results
    @campaign = current_user.campaigns.first
  end

  def come_back_later
  end

  private

  def campaign_params
    params.require(:campaign).permit(:picture_a_id, :picture_b_id, :user_id)
  end

end
class CampaignsController < ApplicationController
 before_action :authenticate_user!

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
    if current_user.target_gender && current_user.target_min_age && current_user.target_max_age && current_user.city
      redirect_to profile_path(current_user.id) unless current_user.campaigns.first
    else
      redirect_to target_profile_path(current_user.id)
    end
  end

  def come_back_later
    if current_user.target_gender && current_user.target_min_age && current_user.target_max_age && current_user.city
      redirect_to profile_path(current_user.id) unless current_user.campaigns.first
    else
      redirect_to target_profile_path(current_user.id)
    end
  end

  def finish_voting
  end

  private

  def campaign_params
    params.require(:campaign).permit(:picture_a_id, :picture_b_id, :user_id)
  end

end
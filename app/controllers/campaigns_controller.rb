class CampaignsController < ApplicationController
 skip_before_action :authenticate_user!

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    @campaign.save
    redirect_to campaign_path(next_campaign(current_user).id)
  end

  def show
    @user = current_user
    @campaign = next_campaign(@user)
    @vote = Vote.new
  end

  private

  def next_campaign(user)
    @target_users = targets(user)
    @target_campaigns = []
    @target_users.each do |target_user|
      @target_campaigns << target_user.campaigns.where(status: true)
    end
    @target_campaigns = @target_campaigns.sort_by { |campaign| campaign.first.user.votes.length }
    @target_campaigns.reverse!
    @voted_campaigns = []
    user.votes.each do |vote|
      @voted_campaigns << vote.campaign_id
    end
    @target_campaigns.to_a.delete_if {|campaign| @voted_campaigns.include?(campaign.first.id)}
    next_campaign = @target_campaigns.first.first
  end

  def targets(user)
    User.where(gender: user.target_gender)
        .where("birthday >= ?", Time.now - user.target_max_age.years - 1.years)
        .where("birthday <= ?", Time.now - user.target_min_age.years)
  end

  def campaign_params
    params.require(:campaign).permit(:picture_a_id, :picture_b_id, :user_id)
  end

end
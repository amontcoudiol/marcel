class VotesController < ApplicationController
  skip_before_action :authenticate_user!   # WHAT THE FUCK
  before_action :set_campaign, only: :create

  def next
    campaign = next_campaign(current_user)
    if campaign
      redirect_to campaign_path(campaign)
    else
      redirect_to come_back_later_path
    end
  end

  def create
    @vote = current_user.votes.new(vote_params)
    @vote.campaign = @campaign
    @vote.save!
    redirect_to next_votes_path
  end

  private

  def next_campaign(user)
    @target_users = user.targets
    @target_campaigns = []
    @target_users.each do |target_user|
      @target_campaigns << target_user.campaigns.where(status: true)
    end
    @target_campaigns = @target_campaigns.flatten.sort_by { |campaign| campaign.user.votes.length }
    @target_campaigns.reverse!
    @voted_campaigns = []
    user.votes.each do |vote|
      @voted_campaigns << vote.campaign_id
    end
    @target_campaigns.to_a.delete_if {|campaign| @voted_campaigns.include?(campaign.id)}
    @target_campaigns.first
  end

  def vote_params
    params.require(:vote).permit(:voted_picture_id)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
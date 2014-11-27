class VotesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @vote = @campaign.votes.new
  end

  def create
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      redirect_to campaign_path(next_campaign(current_user).id)
    else
      render :new
    end
  end

  def end
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

  def vote_params
    params.require(:vote).permit(:voted_picture_id, :user_id, :campaign_id)
  end

end
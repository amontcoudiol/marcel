class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def target
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(target_params)
  end

  def destroy
  end

  private

  def next_campaign
    @user = User.find(36) # to be replaced by current_user
    @target_users = targets(@user)
    @target_campaigns = []
    @target_users.each do |user|
      @target_campaigns << user.campaign.where(status: true)
    end
    @target_campaigns = @target_campaigns.sort_by { |campaign| campaign.user.votes.length }
    @target_campaigns.reverse!
    @voted_campaigns = []
    @user.votes.each do |vote|
      @voted_campaigns << vote.campaign_id
    end
    @target_campaigns.to_a.delete_if {|campaign| @voted_campaigns.include?(campaign.id)}
    next_campaign = @target_campaigns.first
  end

  def targets(user)
    User.where(gender: user.target_gender)
        .where("birthday >= ?", Time.now - user.target_max_age.years - 1.years)
        .where("birthday <= ?", Time.now - user.target_min_age.years)
  end

  def target_params
    params.require(:user).permit(:target_gender, :target_min_age, :target_max_age, :city)
  end

end

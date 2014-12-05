class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    if current_user.target_gender && current_user.target_min_age && current_user.target_max_age && current_user.city && current_user.campaigns.first
        redirect_to results_path
    else
      redirect_to target_profile_path(current_user.id)
    end
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
    @campaign = Campaign.new
    @user = current_user
    if @user.update(target_params)
    else
      render :target
    end
  end

  def destroy
  end

  private

  def target_params
    params.require(:user).permit(:target_gender, :target_min_age, :target_max_age, :city)
  end

end

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

  def target_params
    params.require(:user).permit(:target_gender, :target_min_age, :target_max_age, :city)
  end


end


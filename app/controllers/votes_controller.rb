class VotesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @vote = @campaign.votes.new
  end

  def create
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      redirect_to voting_path
    else
      render :new
    end
  end

  def end
  end

  private

  def vote_params
    params.require(:vote).permit(:voted_picture_id, :user_id, :campaign_id)
  end

end
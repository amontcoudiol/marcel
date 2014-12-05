class PicturesController < ApplicationController
  before_action :authenticate_user!

  def create
    @picture = Picture.create!(photo_params)
    render json: @picture
  end

  def show
  end

  def end
  end

  private

  def photo_params
    params.require(:picture).permit(:file)
  end

end

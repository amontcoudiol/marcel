class PicturesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @picture = Picture.new(picture)
    @picture.save
    redirect_to picture_a_path(@picture.file)
  end

  def show
  end

  def end
  end

end


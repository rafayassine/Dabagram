class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def created
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to "/"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def find_picture
    @picture = Picture.find(params[:id])
  end
  def picture_params
    params.require(:picture).permit(:title, :description)
  end

end

class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all.order("created_at DESC")
  end

  def show
  end

  def new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to @picture, notice: "Yeeeees, it's posted"
    else
      render 'new', notice: "Ouups, something went wrong"
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

class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all.order("created_at DESC")
  end

  def show
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to @picture, notice: "Yeeeees, it's posted !"
    else
      render 'new', notice: "Ouups, something went wrong"
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: "Picture updated !"
    else
      render 'edit', notice: "Ouups, something went wrong"
    end
  end

  def destroy
    @picture.destroy
    redirect_to root_path, notice: "Picture deleted"
  end

  private
  def find_picture
    @picture = Picture.find(params[:id])
  end
  def picture_params
    params.require(:picture).permit(:title, :description, :image)
  end

end

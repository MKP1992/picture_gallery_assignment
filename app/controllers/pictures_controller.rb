class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  
  def index
    if params[:category].blank?
      @pictures = Picture.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @pictures = Picture.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @picture.category_id = params[:category_id]
    if @picture.update(picture_params)
      redirect_to picture_path(@picture)
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to root_path
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :user_id, :category_id, :picture_img)
  end

  def find_picture
    @picture = Picture.find(params[:id])
  end
end
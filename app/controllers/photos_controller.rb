class PhotosController < ApplicationController

  before_action :find_photo, only: [:show, :destroy]

  def new
    @gallery = Gallery.find_by(id: params[:gallery_id])
    @photo = Photo.new
  end

  def show
    @gallery = @photo.gallery
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      flash[:success] = "New photo saved to #{@gallery.title}"
      if params[:accept]
        redirect_to new_gallery_photo_path
      else
        redirect_to @gallery
      end
    else
      flash[:warning] = "Photo upload failed, please try again."
      redirect_to new_photo_path
    end
  end

  def destroy
    @gallery = @photo.gallery
    @photo.destroy
    redirect_to @gallery
  end

  private

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :photo)
  end

  def owned_by
    unless @photo = current_user.photos.find(params[:id])
      flash[:warning] = "You don't have permission to do that."
      redirect_to :root
    end
  end


end

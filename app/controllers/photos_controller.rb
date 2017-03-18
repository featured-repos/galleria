class PhotosController < ApplicationController

  def new
    @gallery = Gallery.find_by(id: params[:gallery_id])
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new(photo_params)
    if @photo.save
      flash[:success] = "New photo saved to #{@gallery.title}"
      redirect_to @gallery
    else
      redirect_to new_photo_path
    end
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :photo)
  end


end

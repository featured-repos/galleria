class GalleriesController < ApplicationController

  before_action :current_user, only: [:create, :edit, :update, :destroy]
  before_action :find_gallery, only: [:show, :edit, :update, :destroy, :share, :send_share]
  before_action :require_user, only: [:create, :edit, :update, :destroy]

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      flash[:success] = "New gallery created"
      redirect_to :dashboard
    else
      flash[:warning] = "Something got borked, please try again"
    end
  end

  def show
    # @gallery = Gallery.includes(:photos).find(params[:id])
    # .include reduces number of sql queries
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      flash[:success] = "Gallery updated!"
      redirect_to @gallery
    else
      flash[:warning] = "Update failed, please try again."
      redirect_to edit_gallery_path
    end
  end

  def destroy
    @gallery.destroy
    flash[:danger] = "#{@gallery.title} deleted."
    redirect_to :dashboard
  end

  def share
  end

  def send_share
    @send_to = params[:share][:email]
    GalleryMailer.share(@gallery, @send_to).deliver
    flash[:success] = "Email sent!"
    redirect_to @gallery
  end

  private

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description)
  end

  def owned_by
    unless @gallery = current_user.galleries.find(params[:id])
      flash[:warning] = "You don't have permission to do that."
      redirect_to :root
    end
  end

end

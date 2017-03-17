class GalleriesController < ApplicationController

  def new
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

end

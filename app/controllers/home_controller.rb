class HomeController < ApplicationController

  # GET /
  def index
  	@images = Image.latest
  end

  # GET /pictures
  def pictures
    @images = Image.pictures.latest

    render :index
  end

  # GET /photos
  def photos
    @images = Image.photos.latest

    render :index
  end

  # GET /emoticons
  def emoticons
    @images = Image.emoticons.latest

    render :index
  end
end

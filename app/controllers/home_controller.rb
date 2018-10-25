class HomeController < ApplicationController

  # GET /
  def index
  	@images = Image.eyes
  end

  # GET /pictures
  def pictures
  	@images = Image.pictures

  	render :index
  end

  # GET /photos
  def photos
  	@images = Image.photos

  	render :index
  end

  # GET /emoticons
  def emoticons
  	@images = Image.emoticons

  	render :index
  end
end

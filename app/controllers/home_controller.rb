class HomeController < ApplicationController

  # GET /
  def index
  	@images = Image.where(image_type: 0)
  end

  # GET /pictures
  def pictures
  	@images = Image.where(image_type: 1)

  	render :index
  end

  # GET /photos
  def photos
  	@images = Image.where(image_type: 2)

  	render :index
  end

  # GET /emoticons
  def emoticons
  	@images = Image.where(image_type: 3)

  	render :index
  end
end

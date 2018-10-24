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
end

class HomeController < ApplicationController

  # GET /
  def index
    @pictures = Picture.all
  end
end

class HomeController < ApplicationController

  # GET /
  def index
    @images = Image.all
  end
end

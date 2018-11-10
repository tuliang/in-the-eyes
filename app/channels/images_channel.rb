class ImagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:room]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

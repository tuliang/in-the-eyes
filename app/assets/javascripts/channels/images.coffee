$(document).ready ->
  comments = $('#comments');

  if comments.length > 0
    room = comments.data().room;

    App.images = App.cable.subscriptions.create { channel: "ImagesChannel", room: room },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        # Called when there's incoming data on the websocket for this channel
        $("#flash").html('<div class="alert alert-info alert-dismissible fade show" role="alert">
        '+data.user.email+' 说：'+data.comment.content+'
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>');
    

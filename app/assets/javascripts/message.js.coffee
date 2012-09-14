window.Message =
  notice: (msg) ->
    $("#message-box").html("").hide().append("<div class='alert notice fade in'> <a class='close' data-dismiss='alert'' href='#'>&times;</a> #{msg}</div>").slideDown("slow")

    setTimeout ->
      $("#message-box .notice").slideUp("slow")
    , 5000

  alert: (msg) ->
    $("#message-box").html("").hide().append("<div class='alert alert-error fade in'> <a class='close' data-dismiss='alert'' href='#'>&times;</a> #{msg}</div>").slideDown("slow")

$ ->
  letter_box = []

  pusher = new Pusher 'ece90a7f4794c276c97e'
  pusher.connection.bind 'connected', () ->
    console.log 'connected'

  channel = pusher.subscribe 'letter'

  channel.bind 'new_letter', (data) ->
    setTimeout( ()->
      if $("##{data.model._id}").length == 0
        letter_box.push data  
        $("#exist_new_letter").show()
        $("#exist_new_letter #message").text "새로운 메세지가 #{letter_box.length}개 있습니다."
    , 1500)

  $("#exist_new_letter > #link").click (target) ->
    $("#exist_new_letter").hide()
    $(letter.tag).insertAfter $("#exist_new_letter") for letter in letter_box
    letter_box = []

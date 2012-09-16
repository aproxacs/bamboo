$ ->
  # $("#new-secret-form").modal("show")

  max = $("#new_letter_wraper .samples li").length
  count = 0
  setInterval ->
    $("#new_letter_wraper .samples ul").css("top", "-#{count*30}px")
    count += 1
    if count >= max
      count = 0
  , 3000

  $("ul.letter-stream > li .words").live "click", ->
    letter_id = $(this).parents("li").attr("id")

    if $(this).parents("li").find(".related-letters li").length > 0
      $(this).parents("li").find(".related-letters").html("")
    else
      $("ul.letter-stream .related-letters").html("")
      $.getScript("/letters/#{letter_id}/related")
  $("#popular-letters").hide()

  $(".letter-stream-tabs a").click (event) ->
    event.preventDefault()
    $(".letter-stream").hide()
    $($(this).attr("href")).fadeIn()


$ ->
  $("#new-secret-form").on "shown", ->
    $("#new-secret-form textarea").focus()

  $("#new-secret-form").modal("show")

  max = $("#new_letter_wraper .samples li").length
  count = 0
  setInterval ->
    $("#new_letter_wraper .samples ul").css("top", "-#{count*30}px")
    count += 1
    if count >= max
      count = 0
  , 3000

  $("ul.letter-stream > li .main-letter").live "click", ->
    letter_id = $(this).parents("li").attr("id")
    tab = $(this).parents("ul").attr("id")

    if $(this).parents("li").find(".related-letters li").length > 0
      $(this).parents("li").find(".related-letters").html("")
    else
      $("ul.letter-stream .related-letters").html("")
      $.getScript("/letters/#{letter_id}/related?tab=#{tab}")

  $("#popular-letters").hide()

  $(".letter-stream-tabs a").click (event) ->
    event.preventDefault()
    $(".letter-stream").hide()
    console.log($(this).parents("ul").find("a"))
    $(this).parents("ul").find("li").removeClass("current")
    $(this).parents("li").addClass("current")
    $($(this).attr("href")).fadeIn()

  $("form[data-remote=true]").bind "ajax:before", (event) ->
    $(this).find(".submit.btn").button("loading")

  $("form[data-remote=true]").bind "ajax:complete", (event) ->
    $(this).find(".submit.btn").button("reset")



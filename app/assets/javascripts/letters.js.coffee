$ ->
  $("#new-secret-form").modal("show")

  max = $("#new_letter_wraper .samples li").length
  count = 0
  setInterval ->
    $("#new_letter_wraper .samples ul").css("top", "-#{count*30}px")
    count += 1
    if count >= max
      count = 0
  , 3000

$ ->
  $("#new-secret-form").modal("show")

  max = $("#box-body .samples li").length
  count = 0
  setInterval ->
    $("#box-body .samples ul").css("top", "-#{count*30}px")
    count += 1
    if count >= max
      count = 0
  , 3000

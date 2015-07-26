$(document).ready ->

  $("ul#steps li a").on "click", (event) ->
    event.preventDefault()
    elementClicked = $(this).attr("href")
    destination = $(elementClicked).offset().top
    $('body, html').animate({ scrollTop: destination})
    return

  addCircles = (barLength, unitLength) ->
    numCircles = Math.floor(barLength / unitLength) + 1
    $("li.step").removeClass("active")
    $("li.step:lt("+ numCircles + ")").addClass("active")

  addDynamicField = (listen_to, output_field) ->
    $(listen_to).on 'keyup', ->
        $(output_field).html($(this).val())
  
  addDynamicField("#first_name",".name_placeholder")
  addDynamicField("#college_name",".college_placeholder")
  
  $(window).on 'scroll', (e) ->
    body = document.body
    html = document.documentElement
    height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)
    win_height = Math.max(document.documentElement.clientHeight, window.innerHeight or 0)
    single_width = $("li.location .dot").offset().left - $("li.basic .dot").offset().left
    width_px = $("li.done .dot").offset().left - $("li.basic .dot").offset().left
    bar_offset = $("li.basic .dot").offset().left - 200 + 1
    $('#scrollBar').css(margin: "0 " + bar_offset + 'px')
    width_in_px = $(window).scrollTop() *  width_px / (height  - win_height)
    console.log("------------------")
    console.log("scrollTop: " + $(window).scrollTop())
    console.log("height: " + height)
    console.log("win_height: " + win_height)
    console.log("scrollbar_width: " + width_px)
    console.log("width_in_px: " + width_in_px)
    console.log("------------------")
    $('#scrollBar').css width: (width_in_px) + 'px'
    addCircles(width_in_px,single_width)

  return

  
$(document).ready ->

  $("ul#steps li a").on "click", (event) ->
    event.preventDefault()
    elementClicked = $(this).attr("href")
    destination = $(elementClicked).offset().top
    $('body, html').animate({ scrollTop: destination})
    return

  addCircles = (barLength, unitLength) ->
    numCircles = Math.floor((barLength / unitLength) + 1.2)
    $("li.step").removeClass("active")
    $("li.step:lt("+ numCircles + ")").addClass("active")

  addDynamicField = (listen_to, output_field) ->
    $(listen_to).on 'keyup', ->
      if $(this).val() is ''
        $(output_field).html(default_text)
      else
        $(output_field).html($(this).val())
  
  addDynamicField("#first_name",".name_placeholder")
  addDynamicField("#college_name",".college_placeholder")

  $("#first_name").on 'keyup', ->
      if $(this).val() is ''
        $(".name_placeholder").html('')
      else
        $(".name_placeholder").html(' ' + $(this).val())

  $("#college_name").on 'keyup', ->
      if $(this).val() is ''
        $(".college_placeholder").html('Impressive')
      else
        $(".college_placeholder").html($(this).val() + ', impressive')
  
  calcBarWidth = () ->
    offsets = [$("#form-basic").offset().top,$("#form-location").offset().top,$("#form-short-answer").offset().top,$("#form-long-answer").offset().top,$("#form-done").offset().top]
    px_into_div = -1
    div_in_height = 0
    base_length = 0
    single_width = $("li.location .dot").offset().left - $("li.basic .dot").offset().left
    for h, i in offsets
        if $(window).scrollTop() - h == 0 && px_into_div == -1 && i == offsets.length - 1 && div_in_height == 0
            return single_width * 4
        else if px_into_div == -1 &&  $(window).scrollTop() - h < 0 
            # console.log("subbed offset: " + offsets[i - 1])
            # console.log("scrolltop inside: " + $(window).scrollTop())
            px_into_div = $(window).scrollTop() - offsets[i - 1]
            # console.log("div-in-height: " + h)
            div_in_height = h - offsets[i-1]
            base_length = i - 1
    console.log("px_into_div" + px_into_div)
    console.log("single_width" + single_width)
    console.log("div_in_height" + div_in_height)
    if px_into_div == -1 || div_in_height == 0
        width_in_px = $("li.done .dot").offset().left - $("li.basic .dot").offset().left
    else
        width_in_px = px_into_div *  single_width / div_in_height
    # console.log("base_l: " + base_length)
    # console.log("pixels in: " + width_in_px)
    # console.log("px_into_div: " + px_into_div)
    # console.log("% through: " + px_into_div/div_in_height)
    return base_length * single_width + width_in_px

  $(window).on 'scroll', (e) ->
    body = document.body
    html = document.documentElement
    height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)
    win_height = Math.max(document.documentElement.clientHeight, window.innerHeight or 0)
    single_width = $("li.location .dot").offset().left - $("li.basic .dot").offset().left
    width_px = $("li.done .dot").offset().left - $("li.basic .dot").offset().left
    bar_offset = $("li.basic .dot").offset().left - 100 + 1
    $('#scrollBar').css(margin: "0 " + bar_offset + 'px')
    width_in_px = $(window).scrollTop() *  width_px / (height  - win_height)
    # console.log("------------------")
    # console.log("scrollTop: " + $(window).scrollTop())
    # console.log("height: " + height)
    # console.log("win_height: " + win_height)
    # console.log("scrollbar_width: " + width_px)
    # console.log("width_in_px: " + width_in_px)
    # console.log("calc: " + calcBarWidth())
    # console.log("------------------")
    width_in_px = calcBarWidth()
    $('#scrollBar').css width: (width_in_px) + 'px'
    addCircles(width_in_px,single_width)

  return

  
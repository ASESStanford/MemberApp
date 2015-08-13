(function() {
  $(document).ready(function() {
    var addCircles, calcBarWidth;
    $("ul#steps li a").on("click", function(event) {
      var destination, elementClicked;
      event.preventDefault();
      elementClicked = $(this).attr("href");
      destination = $(elementClicked).offset().top;
      $('body, html').animate({
        scrollTop: destination
      });
    });
    addCircles = function(barLength, unitLength) {
      var numCircles;
      numCircles = Math.floor((barLength / unitLength) + 1.2);
      $("li.step").removeClass("active");
      return $("li.step:lt(" + numCircles + ")").addClass("active");
    };
    $("#birth-day, #birth-month, #birth-year").on('change', function() {
      var day, month, year;
      day = $("#birth-day").val();
      month = $("#birth-month").val();
      year = $("#birth-year").val();
      return $("#birth-text").val(month + "/" + day + "/" + year);
    });
    $("#first_name").on('keyup', function() {
      if ($(this).val() === '') {
        return $(".name_placeholder").html('');
      } else {
        return $(".name_placeholder").html(' ' + $(this).val());
      }
    });
    $("#college_name").on('keyup', function() {
      if ($(this).val() === '') {
        return $(".college_placeholder").html('Impressive');
      } else {
        return $(".college_placeholder").html($(this).val() + ', impressive');
      }
    });
    calcBarWidth = function() {
      var base_length, div_in_height, h, i, j, len, offsets, px_into_div, single_width, width_in_px;
      offsets = [$("#form-basic").offset().top, $("#form-location").offset().top, $("#form-short-answer").offset().top, $("#form-long-answer").offset().top, $("#form-done").offset().top];
      px_into_div = -1;
      div_in_height = 0;
      base_length = 0;
      single_width = $("li.location .dot").offset().left - $("li.basic .dot").offset().left;
      for (i = j = 0, len = offsets.length; j < len; i = ++j) {
        h = offsets[i];
        if ($(window).scrollTop() - h === 0 && px_into_div === -1 && i === offsets.length - 1 && div_in_height === 0) {
          return single_width * 4;
        } else if (px_into_div === -1 && $(window).scrollTop() - h < 0) {
          px_into_div = $(window).scrollTop() - offsets[i - 1];
          div_in_height = h - offsets[i - 1];
          base_length = i - 1;
        }
      }
      if (px_into_div === -1 || div_in_height === 0) {
        width_in_px = $("li.done .dot").offset().left - $("li.basic .dot").offset().left;
      } else {
        width_in_px = px_into_div * single_width / div_in_height;
      }
      return base_length * single_width + width_in_px;
    };
    $(window).on('scroll', function(e) {
      var bar_offset, body, height, html, single_width, width_in_px, width_px, win_height;
      body = document.body;
      html = document.documentElement;
      height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight);
      win_height = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
      single_width = $("li.location .dot").offset().left - $("li.basic .dot").offset().left;
      width_px = $("li.done .dot").offset().left - $("li.basic .dot").offset().left;
      bar_offset = $("li.basic .dot").offset().left - 100 + 1;
      $('#scrollBar').css({
        margin: "0 " + bar_offset + 'px'
      });
      width_in_px = $(window).scrollTop() * width_px / (height - win_height);
      width_in_px = calcBarWidth();
      $('#scrollBar').css({
        width: width_in_px + 'px'
      });
      return addCircles(width_in_px, single_width);
    });
  });

}).call(this);

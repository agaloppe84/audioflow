$( document).ready (function() {
  setTimeout(function() {
    $('.alert-info').fadeOut('fast');
  }, 4000);
});


var color = $('#current-track').data("color");

$("#label-like").on( "click", function() {
  $("#radio-like").css("background-color", color);
  $("#radio-dislike").css("background-color", "transparent");
});

$("#label-dislike").on( "click", function() {
  $("#radio-dislike").css("background-color", color);
  $("#radio-like").css("background-color", "transparent");
});

$('.score_form_submit').css("background-color", color);

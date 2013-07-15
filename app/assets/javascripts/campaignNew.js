ajaxPost = function (d) {
  $.ajax({
    type: "POST",
    url: "/campaigns",
    data: d,
    success: function(response) {
      alert(response);
    },
    error: function(response) {
        alert('Server error: ' + response); // This is the part that handles the error being down
    },
    dataType: "html"
  });
}

$(document).ready(function() {
  $('.tournament_selection').change(function() {
    $('.matchdays_left').text($('.tournament_selection').val().split(': '));
    t = $('.tournament_selection option:selected').val().split(': ');
    d = {tournament: t[0], season: t[1]}
    ajaxPost(d);
  });
});
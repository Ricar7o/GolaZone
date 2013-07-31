ajaxPost = function (d) {
  $.ajax({
    type: "POST",
    url: "/campaigns/calculate_weeks_left",
    data: d,
    success: function(response) {
      $('#matchdays').css("display", "block");
      maximum = $.trim(response)
      $('#matchdays_for_tournament input').attr({min: "1", max: maximum});
    },
    error: function(response) {
        alert('Server error: ' + response); // This is the part that handles the error being down
    }
  });
}

$(document).ready(function() {

  // When a tournament is selected, show a new selection box with the number of matchdays available
  $('select.tournament_selection').change(function() {
    // Grab the selected tournament and season
    t = $('select.tournament_selection option:selected').val().split(': ');
    // Split the info from the select into tournament (p0) and season (p1)
    d = {tournament: t[0], season: t[1]};
    // $('#matchdays_for_tournament').load('/campaigns/calculate_weeks_left', d);

    ajaxPost(d);
  });
});
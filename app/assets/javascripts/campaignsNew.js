ajaxPost = function (d) {
  $.ajax({
    type: "POST",
    url: "/campaigns/new",
    data: d,
    success: function(response) {
      alert('OK');
    },
    error: function(response) {
        alert('Server error: ' + response); // This is the part that handles the error being down
    },
    dataType: "html"
  });
}

$(document).ready(function() {

  // When the user selects a tournament, show a new selection box with the number of matchdays available
  $('select.tournament_selection').change(function() {
    t = $('select.tournament_selection option:selected').val().split(': '); // Grab the selected tournament and season
    d = {tournament: t[0], season: t[1]} // Split the information from the select into tournament (position 0) and season (position 1)
    $('#matchdays_for_tournament').load('/campaigns/new #matchdays_recipient', d);

    // ajaxPost(d);
  });
});
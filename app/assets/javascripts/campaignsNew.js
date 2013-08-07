// Calculates the number of weeks left in a particular tournament
//
// d - the Integer ID of the tournament that was selected
//
// Makes the <input> element appear on the screen with the max amount set up.
calculate_weeks_left = function (d) {
  $.ajax({
    type: "POST",
    url: "/tournaments/" + d + "/calculate_weeks_left",
    // data: {tournament_id: d},
    success: function(response) {
      // Make the <div> for matchdays appear again in the page. It had display:none before
      $("#matchdays").css("display", "block");
      // The response was just the max number of available weeks
      maximum = $.trim(response)
      // Make sure the number input can't receive numbers higher than max and focus it.
      $("#matchdays_for_tournament input").attr({min: "1", max: maximum}).focus();
    },
    error: function(response) {
        console.log('Server error: ' + response);
    }
  });
}

// Make an Ajax POST to save the user's pick for a particular match
//
// campaign - the Integer ID of the campaign
// match - the Integer ID of the match
// result - the selected outcome of the match. 'H' for home team, 'D' for draw, 'A' for away team.
//
// In the end it paints the <td> of the selected result by adding a class to it.
make_pick = function(campaign, match, result) {
  // Verify if the user clicked on the same result
  same_pick = $("#" + match + result).hasClass("picked_match");
  // Remove the picked_match class from all the <td>'s in the row
  $("tr#" + match + " td").removeClass("picked_match");
  $.ajax({
    type: "POST",
    url: "/campaigns/" + campaign + "/picks",
    data: {match_id: match, selected_result: result},
    success: function(response){
      // Paint the cell only if the user selected something different.
      if(!same_pick) {
        $("#" + match + result).addClass("picked_match");
      }
    },
    error: function(response){
      console.log("Error when trying to pick " + result + "in match " + match + "in campaign " + campaign);
    }
  });
}

$(document).ready(function() {

  // When a tournament is selected, show a new selection box with the number of matchdays available
  $('select.tournament_selection').change(function() {
    // Grab the selected tournament and season
    t = $('select.tournament_selection option:selected').val();
    calculate_weeks_left(t);
  });

  $(".pickable").click(function() {
    // Grab the campaign id from the url bar
    campaign_id = window.location.pathname.replace("/campaigns/","");
    make_pick(campaign_id, $(this).attr("data-match-id"), $(this).attr("data-result"));
  });

});
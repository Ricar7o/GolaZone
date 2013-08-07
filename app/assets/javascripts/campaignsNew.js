calculate_weeks_left = function (d) {
  $.ajax({
    type: "POST",
    url: "/tournaments/" + d + "/calculate_weeks_left",
    // data: {tournament_id: d},
    success: function(response) {
      $("#matchdays").css("display", "block");
      maximum = $.trim(response)
      $("#matchdays_for_tournament input").attr({min: "1", max: maximum}).focus();
    },
    error: function(response) {
        alert('Server error: ' + response); // This is the part that handles the error being down
    }
  });
}

make_pick = function(campaign, match, result) {
  same_pick = $("#" + match + result).hasClass("picked_match");
  $("tr#" + match + " td").removeClass("picked_match");
  $.ajax({
    type: "POST",
    url: "/campaigns/" + campaign + "/picks",
    data: {match_id: match, selected_result: result},
    success: function(response){
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
    campaign_id = window.location.pathname.replace("/campaigns/","");
    make_pick(campaign_id, $(this).attr("data-match-id"), $(this).attr("data-result"));
  });

});
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.

$(document).on('ajax:success', ".reject_invitation", function (e, response) {
  // remove elem from dom
  $(this).parent().fadeToggle(100, function() {
    $("#pending_invitations").children(1).html(response);
  });
  console.log('Rejected invitation - ', response);
});

$(document).on('ajax:success', ".accept_invitation", function (e, response) {
  // remove elem from dom
  alert("Success");
  $(this).parent().fadeToggle(100);
  console.log('Accepted invitation - ', response);
});
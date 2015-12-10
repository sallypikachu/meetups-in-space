//JAVASCRIPT CODE GOES HERE
var empty;
var valid;

$('#create_meetup_form').on("submit", function(event) {
  event.preventDefault();

  var errorMessage = ""
  var meetup = [$('#meetup_title').val(), $('#meetup_details').val(), $('#meetup_tag').val()]

  errorMessage += valid(meetup)

  debugger;

  if (!empty(errorMessage)) {
    alert("Missing fields:" + errorMessage)
  } else {
    submitMeetupViaAjax(meetup);
  };
});

empty = function(string){
  return (string == null || string.trim() == "")
}

valid = function(meetup) {
  var errors = ""
  if (empty(meetup[0])) {
    errors += "\nTitle"
  };
  if (empty(meetup[1])) {
    errors += "\nDescription"
  };
  if (empty(meetup[2])) {
    errors += "\nTag"
  };
  return errors;
}

submitMeetupViaAjax = function(meetup){
  var request = $.ajax({
    method: "POST",
    url: "/meetups",
    data: {title: meetup[0], details: meetup[1], tag: meetup[2]}
  });

  request.done(function(responseData){
    var li = "<li>" + meetup[0] + "</li><p>" + meetup[1] + " [" + meetup[2] + "]</p>"
    $("ul").append(li)
  })
}

$("#join_meetup_form").on("submit", function(event){
  event.preventDefault();

  meetup_id = $("#join_meetup_form").attr('meetup_id');
  debugger;
  submitJoinMeetupViaAjax(meetup_id);
});

var submitJoinMeetupViaAjax = function(meetup_id) {
  var url = "/meetup/" + meetup_id
  var request = $.ajax({
    method: "POST",
    url: url,
    data: { meetup_id: meetup_id }
  });
  request.done(function(responseData) {
    alert("You have successfully joined this meetup.");
  });
}

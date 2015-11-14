var name = "User" + _.random(0, 500000);

function submitRandomChat() {
  var msg = "Test Message" + _.random(0, 500000);
  $('input:eq(0)').val(name);
  $('input:eq(1)').val(msg);
  $('form').trigger('submit');
}

if (Meteor.isClient) {
  Meteor.startup(function() {

    // each user will send one chat every time they connect
    setTimeout(submitRandomChat, 1000);

    // submit random chat ever few seconds
    //randomInterval();
    //function randomInterval() {
      //setTimeout(randomInterval, _.random(1000, 5000));
      //submitRandomChat();
    //}

  });
}

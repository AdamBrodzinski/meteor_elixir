Chats = new Mongo.Collection('chats');

if (Meteor.isClient) {
  Template.chats.helpers({
    chatData: function() {
      return Chats.find({}, {sort: {time: 1}});
    }
  });

  Template.inputBar.events({
    'submit': function (e) {
      e.preventDefault();
      let username = $('input:eq(0)').val();
      let message = $('input:eq(1)').val();

      Chats.insert({name: username, message, time: Date.now()})

      message = $('input:eq(1)').val('');
      $("ul").scrollTop($("ul").scrollTop() + 100);
    }
  });

  Template.chat.onRendered(function() {
    // scroll down on render
    var myDiv = $("ul");
    myDiv.animate({ scrollTop: myDiv.prop("scrollHeight") - myDiv.height() }, 0);
  })
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    // code to run on server at startup
  });
}

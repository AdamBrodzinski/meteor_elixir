// we'll use a local collection to store incoming data
Chats = new Mongo.Collection(null);
// old collection - Chats = new Mongo.Collection('chats');

if (Meteor.isClient) {
  /* Wire up Phoenix on startup */
  const {Socket} = PhoenixRuntime;
  const socket = new Socket("ws://localhost:4000/socket")

  // TODO add authentication with Meteor `_loginToken`
  socket.connect(/* {token: window.userToken} */)

  // join the rooms channel with a topic of 'lobby' (public)
  const channel = socket.channel("rooms:lobby", {})

  channel.join()
  // prime minimongo with last 20 chats on succ. join
  .receive("ok", resp => {
    resp.initialChats.forEach(doc => {
      Chats.insert(doc);
    });
  })
  .receive("error", resp => alert("Unable to join:" + resp.reason))

  channel.on("new_msg", doc => {
    Chats.upsert(doc._id, doc); // insert in local minimongo cache
  })
  /* End Phoenix wiring */


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

      const id = Chats.insert({username, message, time: Date.now()})
      channel.push('new_msg', Chats.findOne(id))

      message = $('input:eq(1)').val(''); // reset form send
      $("ul").scrollTop($("ul").scrollTop() + 100);
    }
  });

  Template.chat.onRendered(function() {
    // scroll down on render
    var myDiv = $("ul");
    myDiv.animate({ scrollTop: myDiv.prop("scrollHeight") - myDiv.height() }, 0);
  })
}
// END isClient





if (Meteor.isServer) {
  Meteor.startup(function () {
    // code to run on server at startup
  });
}

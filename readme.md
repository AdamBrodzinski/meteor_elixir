# Meteor Elixir Chatroom

This repo shows you how to take an expensive Meteor publication and convert it to a Phoenix channel. This allows you to scale larger (or cheaper) with the same user functionality and the majority of your Meteor codebase. You can then migrate as much as you need when bottlenecks occur.


Checkout the commits to see how you can migrate a Meteor app to Phoenix. The most important bits are here, where the client accepts an incoming message and we merge it into Mongo. This allows you to keep your frontent code the same in most cases.

```javascript
// we'll use a local collection to store incoming data
Chats = new Mongo.Collection(null);

  channel.join()
  // prime minimongo with last 20 chats on join
  .receive("ok", resp => {
    resp.initialChats.forEach(doc => {
      Chats.insert(doc);
    });
  })

  ...
  
  channel.on("new_msg", doc => {
    // upsert because messages we sent will result in duplicates if we insert
    Chats.upsert(doc._id, doc);
  })
```

const router = require("express").Router();
const Message = require("../models/Message");
const mongoose = require("mongoose");


router.route("/send").post((req, res) => {

    const senderId = req.body.senderId;
    const senderName = req.body.senderName;
    const text = req.body.text;
    const media = req.body.media;
    const locationLat = req.body.locationLat;
    const locationLong = req.body.locationLong;
  
    const newMessage = new Message({
      senderId,
      senderName,
      text,
      media,
      locationLat,
      locationLong
    });
  
    newMessage
      .save()
      .then(() => res.status(200).json("Message sent!"))
      .catch((err) => res.status(400).json("Error: " + err));
  });

//read all
router.route("/").get((req, res) => {
    Message.find()
      .then((messages) => {
        res.status(200).json(messages)
        console.log(JSON.stringify(messages))
})
      .catch((err) => res.status(400).json("Error: " + err));
  });

  module.exports = router;
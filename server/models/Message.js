const mongoose = require("mongoose");
const Schema = mongoose.Schema;

// var senderId: String
// var senderName: String
// var timeStamp: Double = Date.now.timeIntervalSince1970
// var text: String
// var media: [String]
// var locationLat: Double
// var locationLong: Double

const messageSchema = new Schema(
  {
    senderId: {
      type: String,
      required: true,
      unique: false,
      trim: false,
    },
    senderName: {
        type: String,
        required: true,
        unique: false,
        trim: false,
      },
    text: {
        type: String,
        required: true,
        unique: false,
        trim: false,
    },
    media: {
      type: Array,
      required: false,
    },
    locationLat: {
      type: Number,
      required: false,
    },
    locationLong: {
      type: Number,
      required: false,
    },
  },
  {
    timestamps: true
  }
);

const Message = mongoose.model("Message", messageSchema);

module.exports = Message;
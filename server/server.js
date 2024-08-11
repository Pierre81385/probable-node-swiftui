const express = require('express');
const mongoose = require("mongoose");
const bodyParser = require('body-parser');
const cors = require("cors");
const dotenv = require("dotenv");
const http = require("http"); // Require the http module
const socketIo = require("socket.io"); // Require the socket.io module

dotenv.config();

const app = express();
const port_api = process.env.PORT_API || 3000;
const port_socket = process.env.PORT_SOCKET || 4200;

app.use(bodyParser.json());
app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGODB_URI);

const MessageRoutes = require("./routes/MessageRoutes");
app.use("/message", MessageRoutes);

app.get('/', (req, res) => {
    res.send('Hello from Node.js server!');
  });
  
app.listen(port_api, () => {
    console.log(`Server running at http://localhost:${port_api}`);
    console.log(`Socket.io listening on port: ${port_socket}`);
});

// Socket.IO setup
const server = http.createServer(app); 
const io = socketIo(server, {
  cors: {
    origin: [`http://localhost:${port_socket}`],
    methods: ["GET", "POST", "PUT", "DELETE"],
  },
}); 

app.use((req, res, next) => {
    req.io = io;
    res.io = io;
    next();
  });

io.listen(port_socket)

io.on("connection", (socket) => {
    console.log(`A user connected`);

    socket.on("joined", (data) => {
      console.log(JSON.stringify(data))
      io.emit("newUser", [data])
  })

    socket.on("messageSent", (data) => {
        console.log(JSON.stringify(data))
        io.emit("newMessage", [{"message": "Update message stream."}])
    })
  
    socket.on("disconnect", (data) => {
      console.log("A user disconnected");
    });
  });

app.use(
    cors({
    origin: [`http://localhost:${port_socket}`],
    methods: ["GET", "POST", "PUT", "DELETE"],
})
);





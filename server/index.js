/** @format */

console.log("hello world");

//import from pkgs
const express = require("express");
const app = express();
const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");

// import from other files
const authRouter = require("./routes/auth");

//middleware
app.use(express.json());
app.use(authRouter);

// inits
const PORT = 3008;

//connections
app.listen(PORT, "0.0.0.0", () => console.log(`connected on port ${PORT}`));

const connectToDb = async () => {
  try {
    let dbStats = await mongoose.connect(
      "mongodb://127.0.0.1:27017/amazon"
    );
    console.log(mongoose.connection.readyState);
    if (!dbStats) {
      console.log("disconnected");
      console.log(mongoose.connection.readyState);
    } else {
      console.log("connected to the db");
    }
  } catch (error) {
    console.log(error, "look here");
  }
};
connectToDb();

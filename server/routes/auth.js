/** @format */

const express = require("express");
const User = require("../model/user");
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");

// signup logic
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with the same email already exisit" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      name,
    });

    user = await user.save();
    res.json(user);
    console.log(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
    console.log(e);
  }
});

// sign in logic
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    // check if the user exist
    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email. does not exist" });
    }

    // check the password
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect Password" });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// validate token
authRouter.post("/api/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);

    const isVerified = jwt.verify(token, "passwordKey");
    if (!isVerified) res.json(false);

    const user = await User.findById(isVerified.id);
    if (!user) return res.json(false);

    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//getUser data

authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  console.log(user);
  res.json({ ...user._doc });
});

module.exports = authRouter;

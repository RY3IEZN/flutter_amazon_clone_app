/** @format */

const jwt = require("jsonwebtoken");
const User = require("../model/user");

const admin = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "no auth token, access denied" });

    const isVerified = jwt.verify(token, "passwordKey");
    if (!isVerified)
      return res
        .status(401)
        .json({ msg: "token verification failed, authorization denied" });

    const user = await User.findById(isVerified.id);
    if (user.type == "user" || user.type == "Seller") {
      return res
        .status(401)
        .json({ msg: "You are not an admin, access denied" });
    }

    req.user = isVerified.id;
    req.token = token;
    next();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = admin;

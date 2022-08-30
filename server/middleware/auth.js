/** @format */

const jwt = require("jsonwebtoken");

const auth = async (req, res, next) => {
  try {
    const token = req.headers("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "no auth token, access denied" });

    const isVerified = jwt.verify(token, "passwordKey");
    if (!isVerified)
      res
        .status(401)
        .json({ msg: "token verification failed, authorization denied" });

    req.user = isVerified.id;
    req.token = token;

    next();
  } catch (error) {
    res.status(500).json({});
  }
};

module.exports = auth;

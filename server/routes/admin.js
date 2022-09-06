/** @format */

const express = require("express");
const adminRouter = express.Router();
const admin = require("../middleware/admin");
const Product = require("../model/product");

// post route for admin

adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, images, price, quantity, category } = req.body;
    let product = new Product({
      name,
      description,
      images,
      price,
      quantity,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = adminRouter;

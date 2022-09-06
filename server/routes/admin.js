/** @format */

const express = require("express");
const adminRouter = express.Router();
const admin = require("../middleware/admin");
const Product = require("../model/product");

// posts products for admin
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

// get products and display on the screen

adminRouter.get("/admin/get-product", admin, async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

//delete the posts
adminRouter.post("/admin/delete-product", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = adminRouter;

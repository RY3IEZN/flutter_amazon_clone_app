import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_amazonclone/common/error_handling.dart';
import 'package:flutter_amazonclone/common/utils.dart';
import 'package:flutter_amazonclone/model/product_model.dart';
import 'package:flutter_amazonclone/provider/user_provider.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProuct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final Cloudinary = CloudinaryPublic("dbhlr2zv0", "girblat4");
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await Cloudinary.uploadFile(
            CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);

      http.Response res = await http.post(
          Uri.parse("http://192.168.0.232:3008/admin/add-product"),
          headers: {
            "Content-type": "application/json; charset=UTF-8",
            "x-auth-token": userProvider.user.token
          },
          body: product.toJson());

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product added succesfully");
            Navigator.pop(context);
          });
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}

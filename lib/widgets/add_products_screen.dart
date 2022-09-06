import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/common/custom_button.dart';
import 'package:flutter_amazonclone/common/custom_textfield.dart';
import 'package:flutter_amazonclone/common/utils.dart';
import 'package:flutter_amazonclone/services/admin_service.dart';

import '../common/global_variables.dart';

class AddProductsScreen extends StatefulWidget {
  static const String routeName = "/add-product";
  AddProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  final _addProductFormKey = GlobalKey<FormState>();

  List<String> productCategories = [
    "Mobiles",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion"
  ];

  String categora = "Mobiles";

  List<File> images = [];

// addd imgs
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellProuct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProuct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: categora,
          images: images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Text(
            "Add Products",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map(
                            (i) {
                              return Builder(
                                builder: (BuildContext context) =>
                                    Image.file(i),
                              );
                            },
                          ).toList(),
                          options:
                              CarouselOptions(viewportFraction: 1, height: 200),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(20),
                            dashPattern: [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Select Product images"),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomeTextField(
                  hintText: "Product Name",
                  controller: productNameController,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomeTextField(
                  hintText: "Descritpion",
                  controller: descriptionController,
                  maxLines: 7,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomeTextField(
                  hintText: "Price",
                  controller: priceController,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomeTextField(
                  hintText: "Quanitity",
                  controller: quantityController,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: categora,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map(
                      (String item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      },
                    ).toList(),
                    onChanged: (String? newVal) {
                      setState(
                        () {
                          categora = newVal!;
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: "Submit",
                  onPressed: sellProuct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

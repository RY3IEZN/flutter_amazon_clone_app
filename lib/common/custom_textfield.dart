import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({Key? key, this.controller, this.hintText})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return " Enter your $hintText";
        }
        return null;
      },
    );
  }
}

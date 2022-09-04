import 'package:flutter/material.dart';

class CustomAccountButtons extends StatelessWidget {
  const CustomAccountButtons(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black12.withOpacity(0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: onPressed,
            child: Text(text,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal))),
      ),
    );
  }
}

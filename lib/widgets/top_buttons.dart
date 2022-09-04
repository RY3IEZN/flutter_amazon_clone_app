import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/common/custom_account_button.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomAccountButtons(text: "Your Orders", onPressed: () {}),
            CustomAccountButtons(text: "Become a Seller", onPressed: () {})
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CustomAccountButtons(text: "Your Wishlist", onPressed: () {}),
            CustomAccountButtons(text: "Log Out", onPressed: () {})
          ],
        )
      ],
    );
  }
}

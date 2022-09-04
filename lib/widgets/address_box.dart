import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 233),
          ],
          stops: [0.5, 1.1],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            size: 20,
          ),
          Expanded(
            child: Text(
              "Delivery to ${user.name}- ${user.address} ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.arrow_drop_down_outlined,
            size: 18,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/common/global_variables.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    GlobalVariables.categoryImages[index]["image"]!,
                    fit: BoxFit.cover,
                    height: 43,
                    width: 43,
                  ),
                ),
              ),
              Text(GlobalVariables.categoryImages[index]["title"]!)
            ],
          );
        },
      ),
    );
  }
}

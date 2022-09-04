import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/common/global_variables.dart';

class CarouselSliderImage extends StatelessWidget {
  const CarouselSliderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GlobalVariables.carouselImages.map((i) {
          return Builder(builder: (BuildContext context) => Image.network(i));
        }).toList(),
        options: CarouselOptions(viewportFraction: 1, height: 200));
  }
}

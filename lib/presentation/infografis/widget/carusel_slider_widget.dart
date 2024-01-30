import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jdih_bumn/constants/constants.dart';

class CaruselSliderWidget extends StatelessWidget {
  const CaruselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselController controller1 = CarouselController();

    return CarouselSlider(
      items: Constants.sliderImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Image.asset(
              i,
              fit: BoxFit.contain,
              height: 300,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          height: 300,
          initialPage: 0),
      carouselController: CarouselController(),
    );
  }
}

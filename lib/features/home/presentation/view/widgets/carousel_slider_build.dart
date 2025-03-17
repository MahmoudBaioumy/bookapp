import 'package:bookapp/core/utils/assets_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderBuild extends StatefulWidget {
  const CarouselSliderBuild({super.key});

  @override
  State<CarouselSliderBuild> createState() => _CarouselSliderBuildState();
}

class _CarouselSliderBuildState extends State<CarouselSliderBuild> {
  final List carouselimages = [
    AssetsManager.loginlogo,
    AssetsManager.cross1,
    AssetsManager.cross2,
    AssetsManager.cross3,
  ];
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselimages.length,
      itemBuilder:
          (BuildContext context, int itemIndex, int pageViewIndex) => ClipRRect(
            // this is the temp is build and the count //
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              carouselimages[itemIndex],
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
      options: CarouselOptions(
        height: 160,
        aspectRatio: 10 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {
          setState(() {
            pageindex = index;
          });
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

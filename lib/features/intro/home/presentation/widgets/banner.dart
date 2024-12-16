// ignore_for_file: annotate_overrides, prefer_const_constructors

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  int currentIndex = 0;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(25),
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppAssets.blackHeartPng,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
            height: 150,
            viewportFraction: 0.85,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Gap(14),
        SmoothPageIndicator(
          effect: ExpandingDotsEffect(
            spacing: 10.0,
            dotHeight: 7,
            dotWidth: 7,
            strokeWidth: 1.5,
            dotColor: Colors.grey,
            expansionFactor: 5,
            activeDotColor: AppColors.primaryColor,
          ),
          controller:
              PageController(initialPage: currentIndex), // PageController
          count: 3,
          onDotClicked: (index) {},
        ),
      ],
    );
  }
}

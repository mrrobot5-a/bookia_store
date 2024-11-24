// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.backgroundPng,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.logoSvg,
                  width: 250,
                ),
                Gap(20),
                Text(
                  "Order Your Book Now!",
                  style: getBodyTextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

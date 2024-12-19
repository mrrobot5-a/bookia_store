// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/widgets/navBarWidget.dart';
import 'package:bookia_store/features/intro/home/presentation/widgets/banner.dart';
import 'package:bookia_store/features/intro/home/presentation/widgets/books.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AppAssets.logoSvg,
          width: 100,
        ),
        actions: [
          InkWell(
            child: SvgPicture.asset(AppAssets.notificationSvg),
            onTap: () {},
          ),
          Gap(16),
          GestureDetector(
            child: SvgPicture.asset(AppAssets.searchSvg),
            onTap: () {},
          ),
          Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerWidget(),
            Gap(10),
            Books(),
          ],
        ),
      ),
    );
  }
}

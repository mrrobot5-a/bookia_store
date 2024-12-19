// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/features/intro/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentPage = 0;
  List<Widget> pages = [
    HomePage(),
    Center(
      child: Text(
        "BookMark",
      ),
    ),
    Center(
      child: Text(
        "Cart",
      ),
    ),
    Center(
      child: Text(
        "Profile",
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.darkColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.homeSvg,
              colorFilter: ColorFilter.mode(
                currentPage == 0 ? AppColors.primaryColor : AppColors.darkColor,
                BlendMode.srcIn,
              ),
            ),
            label: "profile",
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.bookMarkPng,
                color: currentPage == 1
                    ? AppColors.primaryColor
                    : AppColors.darkColor,
              ),
              label: "Book"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.categorySvg,
                colorFilter: ColorFilter.mode(
                  currentPage == 2
                      ? AppColors.primaryColor
                      : AppColors.darkColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "cart"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.profileSvg,

                colorFilter: ColorFilter.mode(
                  currentPage == 3
                      ? AppColors.primaryColor
                      : AppColors.darkColor,
                  BlendMode.srcIn,
                ),
                // color:
              ),
              label: "profile"),
        ],
      ),
    );
  }
}

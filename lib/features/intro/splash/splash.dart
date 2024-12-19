// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/functions/navigation.dart';
import 'package:bookia_store/core/services/local/app_local_storage.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/widgets/navBarWidget.dart';
import 'package:bookia_store/features/intro/home/presentation/pages/home_screen.dart';
import 'package:bookia_store/features/intro/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    String? token = AppLocalStorage.getCacheData(AppLocalStorage.token);
    Future.delayed(Duration(seconds: 2), () {
      if (token != null) {
        pushWithReplacment(context, NavBarWidget());
      } else {
        pushWithReplacment(context, Welcome());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.logoSvg,
              width: 250,
            ),
            Gap(10),
            Text(
              "Order Your Book Now!",
              style: getFont20TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

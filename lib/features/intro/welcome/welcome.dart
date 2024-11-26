// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/functions/navigation.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/widgets/outlineButton.dart';
import 'package:bookia_store/features/intro/auth/data/presentation/page/login_screen.dart';
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
                Spacer(
                  flex: 2,
                ),
                SvgPicture.asset(
                  AppAssets.logoSvg,
                  width: 250,
                ),
                Gap(20),
                Text(
                  "Order Your Book Now!",
                  style: getFont20TextStyle(),
                ),
                Spacer(
                  flex: 4,
                ),
                Column(
                  children: [
                    CustomButton(
                      color: AppColors.primaryColor,
                      text: "Login",
                      textColor: AppColors.whiteColor,
                      width: 331,
                      height: 56,
                      onpressed: () {
                        pushTo(context, LoginScreen());
                      },
                    ),
                    Gap(20),
                    Outlinebutton(
                      color: AppColors.whiteColor,
                      text: "Register",
                      textColor: AppColors.darkColor,
                      width: 331,
                      height: 56,
                      onpressed: () {},
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

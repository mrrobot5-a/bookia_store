// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

//Show error message
showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: AppColors.redColor,
    content: Text(
      message,
      style: getFont16TextStyle(
        color: AppColors.whiteColor,
      ),
      textAlign: TextAlign.center,
    ),
  ));
}

//ShowloadingDialog

showLoadingDialog(BuildContext context) {
  showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/icons/book.json",
              width: 300,
              height: 300,
              alignment: Alignment.center,
            ),
          ],
        );
      });
}

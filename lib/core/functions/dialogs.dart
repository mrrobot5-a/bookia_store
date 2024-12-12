// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

//Show error message
showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.redColor,
    content: Text(
      message,
      style: getFont16TextStyle(
        color: AppColors.whiteColor,
      ),
    ),
  ));
}

//ShowloadingDialog

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Row(
          children: [
            Lottie.asset(name)
          ],
        );
      });
}

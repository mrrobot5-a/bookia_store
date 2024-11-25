// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onpressed,
    required this.color,
    this.textColor,
  });
  final double width;
  final double height;
  final Function() onpressed;
  final String text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              )),
          onPressed: onpressed,
          child: Text(
            text,
            style: getFont18TextStyle(
              color: textColor ?? Colors.black,
            ),
          ),
        ));
  }
}

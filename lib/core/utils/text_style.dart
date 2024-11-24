// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/utils/colors.dart';
import 'package:flutter/material.dart';


TextStyle getTitleTextStyle(
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
) {
  return TextStyle(
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 24,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyTextStyle(
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
) {
  return TextStyle(
    color: color ?? AppColors.darkGreyColor,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getSmallTextStyle(
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
) {
  return TextStyle(
    color: color ?? AppColors.greyColor,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

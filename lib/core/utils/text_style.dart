// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getTitleTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 24,
  );
}

TextStyle getBodyTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 20,
  );
}

TextStyle getSmallTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkGreyColor,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

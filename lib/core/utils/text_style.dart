// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getFont30TextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 30,
  );
}

TextStyle getFont24TextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 24,
  );
}

TextStyle getFont20TextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getFont18TextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 18,
  );
}

TextStyle getFont16TextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getFont14TextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? AppColors.darkGreyColor,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

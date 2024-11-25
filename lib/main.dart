// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/constants/app_fonts.dart';
import 'package:bookia_store/features/intro/splash/splash.dart';
import 'package:bookia_store/features/intro/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.dmSerif,
      ),
      home: Welcome(),
    );
  }
}

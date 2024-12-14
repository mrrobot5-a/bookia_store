// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/constants/app_fonts.dart';
import 'package:bookia_store/core/services/remote/dio_provider.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/utils/theme.dart';
import 'package:bookia_store/features/intro/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_store/features/intro/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}

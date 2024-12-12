// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/functions/dialogs.dart';
import 'package:bookia_store/core/functions/navigation.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/widgets/navBarWidget.dart';
import 'package:bookia_store/features/intro/auth/data/model/request/user_model_params.dart';
import 'package:bookia_store/features/intro/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_store/features/intro/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_store/features/intro/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_store/features/intro/auth/presentation/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var userNamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        surfaceTintColor: AppColors.whiteColor,
        backgroundColor: AppColors.whiteColor, // Matches the background
        elevation: 0, // Removes the shadow
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back
              },
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(20.5), // Circular border
                  border: Border.all(
                    color: AppColors.borderColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Icon(
                  Icons.arrow_back_ios, // Back arrow icon
                  color: Colors.black, // Icon color
                  size: 25, // Icon size
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterLodaingState) {
            showLoadingDialog(context);
          } else if (state is RegisterSuccessState) {
            pushAndRemoveUntil(context, NavBarWidget());
          } else if (state is AuthErrorState) {
            Navigator.pop(context);

            showErrorDialog(context, state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    "Hello! Register to get started",
                    style: getFont30TextStyle(),
                  ),
                  Gap(32),
                  TextFormField(
                    controller: userNamecontroller,
                    decoration: InputDecoration(
                      hintText: "UserName",
                      hintStyle: getFont16TextStyle(),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a username";
                      }
                      return null;
                    },
                  ),
                  Gap(15),
                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a valid email";
                      }
                      if (!value!.contains('@')) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "email",
                      hintStyle: getFont16TextStyle(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap(15),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a password";
                      }
                      // if (value!.length < 8) {
                      //   return "Password must be at least 8 characters long";
                      // }

                      // if (!value!.contains(RegExp(r'[A-Z]'))) {
                      //   return "Password must contain at least one uppercase letter";
                      // }
                      // if (!value!.contains(RegExp(r'[a-z]'))) {
                      //   return "Password must contain at least one lowercase letter";
                      // }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIconConstraints: BoxConstraints(
                        maxWidth: 56,
                        minWidth: 22,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: GestureDetector(
                          onTap: () {
                            //change eye here},
                          },
                          child: SvgPicture.asset(AppAssets.eyeSvg),
                        ),
                      ),
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap(13),
                  TextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a password";
                      }
                      // if (value!.length < 8) {
                      //   return "Password must be at least 8 characters long";
                      // }
                      // if (!value!.contains('!')) {
                      //   return "Password must contain at least one special character";
                      // }
                      // if (!value!.contains(RegExp(r'[A-Z]'))) {
                      //   return "Password must contain at least one uppercase letter";
                      // }
                      // if (!value!.contains(RegExp(r'[a-z]'))) {
                      //   return "Password must contain at least one lowercase letter";
                      // }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIconConstraints: BoxConstraints(
                        maxWidth: 56,
                        minWidth: 22,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: GestureDetector(
                          onTap: () {
                            //change eye here},
                          },
                          child: GestureDetector(
                            child: SvgPicture.asset(
                              AppAssets.eyeSvg,
                            ),
                          ),
                        ),
                      ),
                      hintText: "Confirm password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap(35),
                  CustomButton(
                    textColor: AppColors.whiteColor,
                    text: "Register",
                    width: 331,
                    height: 56,
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        // Add user registration logic here
                        context.read<AuthBloc>().add(RegisterEvent(
                              UserModelParams(
                                email: emailcontroller.text,
                                name: userNamecontroller.text,
                                password: passwordController.text,
                                passwordConfirmation:
                                    confirmPasswordController.text,
                              ),
                            ));
                      }
                    },
                    color: AppColors.primaryColor,
                  ),
                  Gap(34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: getFont16TextStyle(
                          color: AppColors.darkColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          pushWithReplacment(
                            context,
                            LoginScreen(),
                          );
                        },
                        child: Text(
                          " Login Now",
                          style: getFont16TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

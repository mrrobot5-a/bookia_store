// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
import 'package:bookia_store/features/intro/auth/presentation/page/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailcontroller = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        surfaceTintColor: AppColors.whiteColor,
        backgroundColor: Colors.white, // Matches the background
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
          if (state is LoginLoadingState) {
            showLoadingDialog(context);
          } else if (state is LoginSuccessState) {
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
                    "Welcome back! Glad to see you, Again!",
                    style: getFont30TextStyle(),
                  ),
                  Gap(32),
                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: getFont16TextStyle(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap(15),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
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
                      hintText: "Enter your password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap(13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: getFont14TextStyle(),
                      ),
                    ],
                  ),
                  Gap(30),
                  CustomButton(
                    textColor: AppColors.whiteColor,
                    text: "Login",
                    width: 331,
                    height: 56,
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        // Add user registration logic here
                        context.read<AuthBloc>().add(LoginEvent(
                              UserModelParams(
                                email: emailcontroller.text,
                                password: passwordController.text,
                              ),
                            ));
                      }
                    },
                    color: AppColors.primaryColor,
                  ),
                  Gap(34),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        " Or Login with ",
                        style: getFont16TextStyle(),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  Gap(21),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          height: 56,
                          child: SvgPicture.asset(AppAssets.faceBookSvg),
                        ),
                      ),
                      Gap(8),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          height: 56,
                          child: SvgPicture.asset(AppAssets.googleSvg),
                        ),
                      ),
                      Gap(8),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          height: 56,
                          child: SvgPicture.asset(AppAssets.appleSvg),
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: getFont16TextStyle(
                          color: AppColors.darkColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          pushWithReplacment(
                            context,
                            RegisterScreen(),
                          );
                        },
                        child: Text(
                          "Register Now",
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

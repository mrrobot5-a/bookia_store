// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/features/intro/home/data/models/get_new_arrivals_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatefulWidget {
  BookDetails({super.key, required this.product});
  final Product product;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppAssets.bookMarkPng),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 7.0, left: 22, right: 22, bottom: 10),
          child: Row(
            children: [
              Text(
                widget.product.priceAfterDiscount.toString() + " \$" ?? " ",
                style: getFont24TextStyle(),
              ),
              Gap(45),
              Expanded(
                  child: CustomButton(
                text: "Add To Cart",
                textColor: AppColors.whiteColor,
                width: 200,
                height: 56,
                onpressed: () {},
                color: AppColors.darkColor,
              )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.product.image ?? " ",
                    height: 271,
                  ),
                ),
                Gap(20),
                Text(
                  textAlign: TextAlign.center,
                  widget.product.name ?? " ",
                  style: getFont30TextStyle(),
                ),
                Text(
                  widget.product.category ?? " ",
                  style: getFont16TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
                Gap(16),
                Text(
                  widget.product.description ?? "There is No description",
                  style: getFont14TextStyle(
                    color: AppColors.darkColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/features/intro/home/data/models/get_new_arrivals_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      body: Center(
        child: Column(
          children: [
            Image.network(
              widget.product.image ?? " ",
              height: 271,
            ),
            Text(
              "Black Heart",
              style: getFont30TextStyle(),
            ),
            Text(
              "Broché",
              style: getFont16TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              widget.product.description ?? "There is No description",
              style: getFont14TextStyle(
                color: AppColors.darkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

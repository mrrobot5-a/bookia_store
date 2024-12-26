// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//! watching again from 1:16:00
import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: getFont24TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView.separated(
          itemCount: 2,
          separatorBuilder: (BuildContext context, index) {
            return Divider(
              indent: 10,
              endIndent: 10,
            );
          },
          itemBuilder: (context, index) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    height: 120,
                    width: 100,
                    fit: BoxFit.cover,
                    AppAssets.backgroundPng,
                  ),
                ),
                Gap(10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "The Republic",
                                style: getFont18TextStyle(),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              iconSize: 24,
                              icon: SvgPicture.asset(AppAssets.removeSvg),
                            ),
                          ],
                        ),
                        Text(
                          "270 \$",
                          style: getFont16TextStyle(),
                        ),
                        Gap(22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                              textColor: AppColors.whiteColor,
                              text: "Add To Cart",
                              width: 181.78,
                              height: 40,
                              onpressed: () {},
                              color: AppColors.primaryColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

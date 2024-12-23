// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookia_store/core/constants/app_assets.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/widgets/navBarWidget.dart';
import 'package:bookia_store/features/intro/home/data/models/get_new_arrivals_response/get_new_arrivals_response.dart';
import 'package:bookia_store/features/intro/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Books extends StatefulWidget {
  const Books({
    super.key,
  });

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetNewArrivalsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is NewArrivalsSuccessState) {
          var booksList =
              context.read<HomeBloc>().newArrivalsBooks?.data?.products ?? [];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular Books",
                  style: getFont24TextStyle(),
                ),
                Gap(15),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 11,
                    mainAxisExtent: 300,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: booksList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "${booksList[index].image}",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gap(7),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                booksList[index].name ?? " ",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                // bookList.,
                                style: getFont16TextStyle(),
                              ),
                              Gap(30),
                              Row(
                                children: [
                                  Text(
                                    "${booksList[index].priceAfterDiscount} Eg",
                                    style: getFont16TextStyle(),
                                  ),
                                  Spacer(),
                                  CustomButton(
                                    radius: 4,
                                    text: "Buy",
                                    fontsize: 14,
                                    textColor: AppColors.whiteColor,
                                    color: AppColors.darkColor,
                                    onpressed: () {},
                                    width: 73,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Gap(100),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookia_store/core/functions/navigation.dart';
import 'package:bookia_store/core/utils/colors.dart';
import 'package:bookia_store/core/utils/text_style.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/features/intro/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_store/features/intro/home/presentation/pages/book_details_screen.dart';
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
      buildWhen: (previous, current) =>
          current is NewArrivalsSuccessState ||
          current is NewArrivalsloadingState,
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
                      child: GestureDetector(
                        onTap: () {
                          pushTo(
                              context,
                              BookDetails(
                                product: booksList[index],
                              ));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Expanded(
                                  child: Hero(
                                    tag: booksList[index].id.toString(),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        height: 200,
                                        "${booksList[index].image}",
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Transform.rotate(
                                    angle: 0,
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.discountColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${booksList[index].discount}%",
                                          style: getFont14TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                Gap(3),
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
                                      onpressed: () {
                                        pushTo(
                                            context,
                                            BookDetails(
                                              product: booksList[index],
                                            ));
                                      },
                                      width: 73,
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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

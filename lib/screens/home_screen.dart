// ignore_for_file: deprecated_member_use

import 'package:fashion_ecommerce_ui/components/custom_text.dart';
import 'package:fashion_ecommerce_ui/core/app_colors.dart';
import 'package:fashion_ecommerce_ui/components/custom_appbar.dart';
import 'package:fashion_ecommerce_ui/models/cover_model.dart';
import 'package:fashion_ecommerce_ui/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppbar(isBlack: true),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/texts/10.svg', height: 180),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/texts/Collection.svg'),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/texts/October.svg'),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Gap(120),
                  Image.asset('assets/cover/cover1.png'),
                  Gap(20),

                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.5,
                      crossAxisCount: 2,
                    ),

                    itemCount: ProductModel.porducts.length,
                    itemBuilder: (context, index) {
                      final item = ProductModel.porducts;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(item[index].image),
                          Gap(10),
                          CustomText(text: item[index].name),
                          Gap(6),

                          CustomText(
                            text: item[index].description,
                            color: Colors.grey,
                          ),
                          Gap(6),
                          CustomText(
                            text: "\$ ${item[index].price.toString()}",
                            color: Colors.red[700]!,
                          ),
                        ],
                      );
                    },
                  ),
                  Gap(5),
                  CustomText(
                    text: "You may also like".toUpperCase(),
                    fontSize: 30,
                  ),
                  Gap(5),
                  Image.asset("assets/svcs/line.png", width: 190),
                  Gap(20),
                  SizedBox(
                    height: 450,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: CoverModel.cover.length,
                      itemBuilder: (context, index) {
                        final item = CoverModel.cover;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(item[index].image, height: 400),
                              Gap(10),
                              CustomText(text: item[index].description),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20),
                  Column(
                    children: [
                      Gap(20),
                      Row(
                        spacing: 50,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svcs/Twitter.svg',
                            height: 35,
                            color: Colors.white,
                          ),
                          SvgPicture.asset(
                            'assets/svcs/Instagram.svg',
                            height: 35,
                            color: Colors.white,
                          ),
                          SvgPicture.asset(
                            'assets/svcs/YouTube.svg',
                            height: 35,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Gap(20),
                      Image.asset(
                        "assets/svcs/line.png",
                        width: 190,
                        color: Colors.white,
                      ),
                      Gap(20),

                      CustomText(
                        maxLines: 3,
                        hight: 2,
                        text:
                            "support@openui.design \n      +60 825 876     \n08:00 - 22:00 - Everyday",
                      ), // CustomText
                      Gap(10),
                      Image.asset(
                        "assets/svcs/line.png",
                        width: 190,
                        color: Colors.white,
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 30,
                        children: [
                          CustomText(text: "About"),
                          CustomText(text: "Contact"),
                          CustomText(text: "Blog"),
                        ],
                      ),
                      Gap(20),
                      CustomText(
                        text: "Copyright© OpenUI All Rights Reserved.",
                      ),
                      Gap(30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

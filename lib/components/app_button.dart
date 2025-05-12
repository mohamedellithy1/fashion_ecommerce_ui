// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:fashion_ecommerce_ui/components/custom_text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final bool isSvg;
  final String title;
  final Function()? onTap;
  const AppButton({
    super.key,
    required this.isSvg,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg
                  ? SvgPicture.asset("assets/svcs/shoppingbag.svg")
                  : SizedBox.shrink(),
              Gap(10),
              CustomText(text: title, color: Colors.white, fontSize: 20),
            ],
          ),
        ),
      ),
    );
  }
}

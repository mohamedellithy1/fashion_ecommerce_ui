import 'package:fashion_ecommerce_ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomHead extends StatelessWidget {
  const CustomHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomText(
            text: 'Checkout'.toUpperCase(),
            fontSize: 30,
            spacing: 10,
            color: Colors.black,
          ),
        ),
        Image.asset("assets/svcs/line.png", width: 200, color: Colors.black),
      ],
    );
  }
}

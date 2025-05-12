import 'package:fashion_ecommerce_ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomHead extends StatelessWidget {
  final String text;
  const CustomHead({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomText(
            text: text.toUpperCase(),
            fontSize: 20,
            
            spacing: 10,
            color: Colors.black,
          ),
        ),
        Image.asset("assets/svcs/line.png", width: 200, color: Colors.black),
      ],
    );
  }
}

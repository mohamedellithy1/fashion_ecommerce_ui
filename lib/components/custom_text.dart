import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final int maxLines;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.maxLines = 1,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: "Tenor_Sans",
        fontSize: fontSize,
        color: color,

        fontWeight: fontWeight,
      ),
    );
  }
}

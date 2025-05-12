// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:fashion_ecommerce_ui/components/custom_text.dart';
import 'package:fashion_ecommerce_ui/screens/checkout.dart';

// ignore: must_be_immutable
class CartWidget extends StatefulWidget {
  final String image;
  final String description;
  final String name;
  final int price;

  const CartWidget({
    super.key,
    required this.image,
    required this.description,
    required this.name,
    required this.price,
    required this.onChanged,
  });
  final Function(int number) onChanged;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.image, height: 190),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: widget.name.toUpperCase(),
              spacing: 6,
              color: Colors.black,
            ),
            Gap(10),
            SizedBox(
              width: size.width * 0.5,
              child: CustomText(
                maxLines: 3,
                text: widget.description,
                color: Colors.black,
              ),
            ),
            Gap(20),
            Row(
              children: [
                addAndMinButton(
                  image: "assets/svcs/min.svg",
                  onTap: () {
                    if (quantity == 1) {
                      return;
                    } else {
                      setState(() {
                        quantity--;
                        widget.onChanged(quantity);
                      });
                    }
                  },
                ),
                Gap(10),
                CustomText(text: quantity.toString(), color: Colors.black),
                Gap(10),

                addAndMinButton(
                  image: "assets/svcs/plus.svg",
                  onTap: () {
                    setState(() {
                      quantity++;
                      widget.onChanged(quantity);
                    });
                  },
                ),
              ],
            ),
            Gap(20),
            CustomText(
              text: "\$ ${widget.price.toString()}",
              color: Colors.red[700]!,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ],
    );
  }
}

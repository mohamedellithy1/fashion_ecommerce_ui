import 'package:fashion_ecommerce_ui/components/app_button.dart';
import 'package:fashion_ecommerce_ui/components/cart_widget.dart';
import 'package:fashion_ecommerce_ui/components/custom_appbar.dart';
import 'package:fashion_ecommerce_ui/components/custom_head.dart';
import 'package:fashion_ecommerce_ui/components/custom_text.dart';
import 'package:fashion_ecommerce_ui/screens/placeorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Checkout extends StatefulWidget {
  final String image;
  final String description;
  final String name;
  final int price;

  const Checkout({
    super.key,
    required this.image,
    required this.description,
    required this.name,
    required this.price,
  });

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CustomHead(
              text: "Checkout",
            ),
            Gap(20),
            CartWidget(
              image: widget.image,
              description: widget.description,
              name: widget.name,
              price: widget.price,
              onChanged: (number) {
                setState(() {
                  selectedQuantity = number;
                });
              },
            ),
            Gap(20),
            line(),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: textAndLogo(
                isfree: false,
                height: 20,
                image: "assets/svcs/Vector.svg",

                text: "Add promo code",
              ),
            ),
            Gap(20),
            line(),
            Gap(20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: textAndLogo(
                isfree: true,
                height: 30,
                image: "assets/svcs/Delivery.svg",
                text: "Delivery",
              ),
            ),
            Spacer(),
            Row(
              children: [
                CustomText(text: "Total", color: Colors.black, fontSize: 20),
                Spacer(),
                CustomText(
                  text: "\$ ${widget.price * selectedQuantity}",
                  color: Colors.red[700]!,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Gap(20),
            AppButton(
              isSvg: true,
              title: "Checkout",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Placeorder(
                          quantity: selectedQuantity,
                          totalPrice: widget.price * selectedQuantity,
                          image: widget.image,
                          description: widget.description,
                          name: widget.name,
                          price: widget.price,
                        ),
                  ),
                );
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}

Widget addAndMinButton({required String image, required onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: SvgPicture.asset(image),
    ),
  );
}

Widget line() {
  return Image.asset("assets/svcs/line2.png", color: Colors.black);
}

Widget textAndLogo({
  required String image,
  required String text,
  required bool isfree,
  required double height,
}) {
  return Row(
    children: [
      SvgPicture.asset(image, height: height),
      Gap(10),
      CustomText(text: text, color: Colors.black, fontSize: 20),
      Spacer(),
      isfree
          ? CustomText(text: "Free", color: Colors.black, fontSize: 16)
          : SizedBox(),
    ],
  );
}

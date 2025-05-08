import 'package:fashion_ecommerce_ui/components/custom_appbar.dart';
import 'package:fashion_ecommerce_ui/components/custom_head.dart';
import 'package:fashion_ecommerce_ui/components/custom_text.dart';
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
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CustomHead(),
            Gap(20),
            Row(
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
                              });
                            }
                          },
                        ),
                        Gap(10),
                        CustomText(
                          text: quantity.toString(),
                          color: Colors.black,
                        ),
                        Gap(10),

                        addAndMinButton(
                          image: "assets/svcs/plus.svg",
                          onTap: () {
                            setState(() {
                              quantity++;
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
                  text: "\$ ${widget.price * quantity}",
                  color: Colors.red[700]!,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Gap(20),
            Container(
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
                    SvgPicture.asset("assets/svcs/shoppingbag.svg"),
                    Gap(10),
                    CustomText(
                      text: "Checkout",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
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

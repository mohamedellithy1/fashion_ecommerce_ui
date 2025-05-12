import 'package:fashion_ecommerce_ui/components/app_button.dart';
import 'package:fashion_ecommerce_ui/components/custom_appbar.dart';
import 'package:fashion_ecommerce_ui/components/custom_head.dart';
import 'package:fashion_ecommerce_ui/components/custom_text.dart';
import 'package:fashion_ecommerce_ui/core/app_colors.dart';
import 'package:fashion_ecommerce_ui/screens/add_address.dart';
import 'package:fashion_ecommerce_ui/screens/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Placeorder extends StatefulWidget {
  final String image;
  final String description;
  final String name;
  final int quantity;
  final int totalPrice;
  final int price;
  const Placeorder({
    super.key,
    required this.image,
    required this.description,
    required this.name,
    required this.quantity,
    required this.totalPrice,
    required this.price,
  });

  @override
  State<Placeorder> createState() => _PlaceorderState();
}

class _PlaceorderState extends State<Placeorder> {
  dynamic _saveAddress;
  void _openAddAddress() async {
    final adressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddAddress()),
    );

    if (adressData != null) {
      setState(() {
        _saveAddress = adressData;
      });
    }
  }

  dynamic saveCardData;
  void _openAddCard() async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentMethod()),
    );

    if (cardData != null) {
      setState(() {
        saveCardData = cardData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHead(text: "Checkout"),
            Gap(20),
            CustomText(
              text: "Shipping adress",
              color: Colors.grey,
              fontSize: 20,
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  _saveAddress != null
                      ? Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    _saveAddress['first_name'] +
                                    // ignore: prefer_interpolation_to_compose_strings
                                    " " +
                                    _saveAddress['last_name'],
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              Gap(10),

                              CustomText(
                                text: _saveAddress['address'],
                                color: Colors.grey,

                                fontSize: 14,
                              ),
                              Gap(10),

                              CustomText(
                                text:
                                    _saveAddress['city'] +
                                    // ignore: prefer_interpolation_to_compose_strings
                                    " " +
                                    _saveAddress['state'],
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              Gap(10),

                              CustomText(
                                text:
                                    _saveAddress['zip_code'] +
                                    // ignore: prefer_interpolation_to_compose_strings
                                    " " +
                                    _saveAddress['phone_number'],
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      )
                      : SizedBox.shrink(),
            ),
            Gap(30),
            rowAndIcon(
              onTap: () {
                _openAddAddress();
              },
              isFree: false,
              text: "Add shipping adress",
              icon: Icons.add,
            ),
            Gap(40),
            CustomText(
              text: "Shipping Method",
              color: Colors.grey,
              fontSize: 20,
            ),
            Gap(20),
            rowAndIcon(
              onTap: () {},
              isFree: true,
              text: "Pickup at store",
              icon: Icons.select_all_outlined,
            ),
            Gap(40),
            CustomText(
              text: "Shipping Method",
              color: Colors.grey,
              fontSize: 20,
            ),
            Gap(20),
            saveCardData != null || saveCardData != ""
                ? Row(
                  children: [
                    SvgPicture.asset("assets/svcs/Mastercard.svg"),

                    Gap(10),
                    CustomText(
                      text: saveCardData['cardNumber'] ?? "",
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ],
                )
                : rowAndIcon(
                  onTap: () {
                    _openAddCard();
                  },
                  isFree: false,
                  text: "Payment method",
                  icon: Icons.select_all_outlined,
                ),
            Spacer(),

            Row(
              children: [
                CustomText(text: "Total", color: Colors.black, fontSize: 20),
                Spacer(),
                CustomText(
                  text: "\$ ${widget.totalPrice}",
                  color: Colors.red[700]!,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Gap(20),

            AppButton(isSvg: true, title: "Place order", onTap: () {}),
            Gap(30),
          ],
        ),
      ),
    );
  }
}

Widget rowAndIcon({
  required String text,
  required IconData icon,
  required bool isFree,
  required Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[100],

        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Gap(10),
          CustomText(text: text, fontSize: 22, color: AppColors.primaryColor),
          Spacer(),
          isFree
              ? CustomText(text: "free".toUpperCase(), color: Colors.black)
              : SizedBox.shrink(),
          Gap(20),

          Icon(icon, size: 30),
          Gap(20),
        ],
      ),
    ),
  );
}

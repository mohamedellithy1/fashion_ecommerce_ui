import 'package:fashion_ecommerce_ui/components/app_button.dart';
import 'package:fashion_ecommerce_ui/components/custom_appbar.dart';
import 'package:fashion_ecommerce_ui/components/custom_head.dart';
import 'package:fashion_ecommerce_ui/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;
  CardType cardType = CardType.visa;
  bool showBackView = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomHead(text: "Payment method"),
            Gap(13),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,

              cvvCode: cvvCode,
              isHolderNameVisible: true,

              cardType: CardType.mastercard,
              showBackView: isShow,

              onCreditCardWidgetChange: (v) {
                // onCreditCardModelChange(v);
              },
              cardBgColor: AppColors.primaryColor,
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: onCreditCardModelChange,
              formKey: formKey,
              isCardHolderNameUpperCase: true,
            ),
            Spacer(),
            AppButton(
              isSvg: false,
              title: 'Add card',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Navigator.pop(context, {
                    'cardNumber': cardNumber,
                    'expiryDate': expiryDate,
                    'cardHolderName': cardHolderName,
                    'cvvCode': cvvCode,
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all fields'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardHolderName = data.cardHolderName;
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      cvvCode = data.cvvCode;
      isShow = data.isCvvFocused;
    });
  }
}

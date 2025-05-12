import 'package:fashion_ecommerce_ui/components/app_button.dart';
import 'package:fashion_ecommerce_ui/components/base_text_filed.dart';
import 'package:fashion_ecommerce_ui/components/custom_appbar.dart';
import 'package:fashion_ecommerce_ui/components/custom_head.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomHead(text: "Add shipping adress"),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: BasicTextField(
                    label: "First name",
                    controller: firstNameController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BasicTextField(
                    label: "Last name",
                    controller: lastNameController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BasicTextField(label: "Adress", controller: addressController),
            const SizedBox(height: 16),
            BasicTextField(label: "City", controller: cityController),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: BasicTextField(
                    label: "State",
                    controller: stateController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BasicTextField(
                    label: "ZIP code",
                    controller: zipCodeController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BasicTextField(label: "Phone number", controller: phoneController),
            const Spacer(),
            AppButton(
              isSvg: false,
              title: "Add now",
              onTap: () {
                final data = {
                  "first_name": firstNameController.text,
                  "last_name": lastNameController.text,
                  "address": addressController.text,
                  "city": cityController.text,
                  "state": stateController.text,
                  "zip_code": zipCodeController.text,
                  "phone_number": phoneController.text,
                };

                Navigator.pop(context, data);
              },
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

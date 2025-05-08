// ignore_for_file: deprecated_member_use

import 'package:fashion_ecommerce_ui/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBlack;
  const CustomAppbar({super.key, required this.isBlack});
  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: isBlack ? AppColors.primaryColor : Colors.white,
        leading: SvgPicture.asset(
          'assets/svcs/menu.svg',
          color: isBlack ? Colors.white : AppColors.primaryColor,
        ),
        title: SvgPicture.asset(
          'assets/logo/Logo.svg',
          color: isBlack ? Colors.white : AppColors.primaryColor,
        ),
        leadingWidth: 25,
        centerTitle: true,
        actions: [
          Icon(
            Icons.search_rounded,
            size: 30,
            color: isBlack ? Colors.white : AppColors.primaryColor,
          ),
          Gap(20),
          SvgPicture.asset(
            'assets/svcs/shoppingbag.svg',
            color: isBlack ? Colors.white : AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';

class CustomBlueButton extends StatelessWidget {
  final String buttonText;
  const CustomBlueButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
          color: AppColors.blueThemeColor,
          borderRadius: BorderRadius.circular(12)),
      child: Center(
          child: Text(
        buttonText,
        style: AppTextStyles.buttonText,
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';

class CustomBlueButton extends StatelessWidget {
  final String buttonText;
  final bool isButtonClickable;
  final Function()? onTap;
  final bool isLoading;
  const CustomBlueButton(
      {super.key,
      required this.buttonText,
      this.isButtonClickable = false,
      this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: isButtonClickable
                ? AppColors.blueThemeColor
                : AppColors.greyColor,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: isLoading
                ? SizedBox(
                  height: 19,
                  width: 19,
                  child: CircularProgressIndicator(color: AppColors.whiteColor))
                : Text(
                    buttonText,
                    style: AppTextStyles.buttonText,
                  )),
      ),
    );
  }
}

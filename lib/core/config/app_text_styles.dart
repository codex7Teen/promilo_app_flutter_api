import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';

class AppTextStyles {
  static const TextStyle blueColorButtonsText = TextStyle(
      fontSize: 17,
      color: AppColors.blueThemeColor,
      fontWeight: FontWeight.bold);

  static const TextStyle textFieldsHeadingText =
      TextStyle(fontSize: 18, color: AppColors.darkBlueThemeColor);

  static const TextStyle mainHeadingText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 21,
      color: AppColors.darkBlueThemeColor);

  static const TextStyle promiloText = TextStyle(fontWeight: FontWeight.bold);

  static const TextStyle rememberMeText =
      TextStyle(color: AppColors.darkGreyColor, fontSize: 16.2);

  static const TextStyle buttonText = TextStyle(
      fontWeight: FontWeight.bold, color: AppColors.whiteColor, fontSize: 17);
}

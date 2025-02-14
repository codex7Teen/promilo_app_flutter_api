import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';

class CustomAuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomAuthTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: AppColors.darkGreyColor)),
      child: TextFormField(
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.darkGreyColor, fontSize: 16),
            border: InputBorder.none),
      ),
    );
  }
}

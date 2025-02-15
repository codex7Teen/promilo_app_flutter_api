import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';

class HomeScreenWidgets {
  static PreferredSizeWidget buildAppbar() {
    return AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(7),
          child: Container(
            height: 0.4,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.5),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: Offset(0, 1),
                    blurRadius: 1,
                    spreadRadius: 0.2),
              ],
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Individual Meetup',
            style: AppTextStyles.promiloText,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Icon(Icons.arrow_back_ios_new_rounded, size: 19, color: AppColors.darkBlueThemeColor,),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/features/home/presentation/widgets/home_screen_widgets.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! APP-BAR
      appBar: HomeScreenWidgets.buildAppbar(),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
        child: Column(
          children: [
            //! SEARCH-BAR
            Container(
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 20),
              height: 49,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.darkBlueThemeColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/search_icon.png',
                      color: AppColors.darkBlueThemeColor),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text('Search',
                        style: TextStyle(
                            fontSize: 19, color: AppColors.darkGreyColor)),
                  ),
                  Image.asset('assets/images/microphone_icon.png',
                      width: 27, color: AppColors.darkBlueThemeColor),
                ],
              ),
            ),

            //! CAROUSEL
          ],
        ),
      ),
    );
  }
}

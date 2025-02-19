import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/features/description/controller/description_controller.dart';
import 'package:promilo_flutter_app/features/description/presentation/widgets/description_screen_widgets.dart';

class ScreenDescription extends StatelessWidget {
  ScreenDescription({super.key});

  //! INJECTING THE CONTROLLER
  final descriptionScreenController = Get.put(DescriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! APPBAR
      appBar: DescriptionScreenWidgets.buildAppbar(),
      backgroundColor: AppColors.whiteColor,
      //! BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! IMAGES SECTION
              DescriptionScreenWidgets.buildCarouselSection(
                  context, descriptionScreenController),
              SizedBox(height: 14),
              //! RATINGS AND DETAILS DISPLAY.
              DescriptionScreenWidgets.buildRatingsSection(),
              SizedBox(height: 22),
              //! ACTOR NAME HEADING
              DescriptionScreenWidgets.buildActorNameText(),
              SizedBox(height: 2),
              //! ACTOR HEADING DESCRIPTION
              DescriptionScreenWidgets.buildDescriptionheading(),
              SizedBox(height: 14),
              //! DURATIONS SECTION
              DescriptionScreenWidgets.buildDurationSection(),
              SizedBox(height: 10),
              //! TOTAL AVERAGE FEES SECTION
              DescriptionScreenWidgets.buildTotalAverageSection(),
              SizedBox(height: 14),
              //! ACTOR ABOUT SECTION
              DescriptionScreenWidgets.buildAboutHeading(),
              SizedBox(height: 2),
              DescriptionScreenWidgets.buildDescription(
                  descriptionScreenController),
              SizedBox(height: 3),
              DescriptionScreenWidgets.buildSeeMoreButton(
                  descriptionScreenController)
            ],
          ),
        ),
      ),
    );
  }
}

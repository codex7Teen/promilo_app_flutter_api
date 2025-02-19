import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/features/home/controller/home_screen_controller.dart';
import 'package:promilo_flutter_app/features/home/presentation/widgets/home_screen_widgets.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  //! INJECTING THE CONTROLLER
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! APP-BAR
      appBar: HomeScreenWidgets.buildAppbar(),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //! SEARCH-BAR
              HomeScreenWidgets.buildSearchBar(),
              SizedBox(height: 18),
              //! CAROUSEL
              HomeScreenWidgets.buildCarousel(homeScreenController),
              SizedBox(height: 12),
              //! PAGE INDICATOR
              HomeScreenWidgets.buildPageIndicator(homeScreenController),
              SizedBox(height: 20),
              //! TRENDING POPULAR PEOPLE TITIL
              HomeScreenWidgets.buildTrendingPeopleTitle(),
              SizedBox(height: 10),
              //! BUILD TRENDING PEOPLE CARDS
              HomeScreenWidgets.buildTrendingPeopleCards(),
              SizedBox(height: 20),
              //! TOP TRENDING MEETUPS TITLE
              HomeScreenWidgets.buildTrendingPeopleTitle(),
              SizedBox(height: 10),
              //! TOP TRENDING MEETUPS CARDS
              HomeScreenWidgets.buildToptrendinMeetupCards()
            ],
          ),
        ),
      ),
    );
  }
}

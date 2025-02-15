import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

              //! TRENDING POPULAR PEOPLE TITILE
              HomeScreenWidgets.buildTrendingPeopleTitle(),
              SizedBox(height: 10),

              //! BUILD TRENDING PEOPLE CARDS
              HomeScreenWidgets.buildTrendingPeopleCards(),
              SizedBox(height: 20),

              //! TOP TRENDING MEETUPS TITLE
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  'Top Trending Meetups',
                  style: TextStyle(
                    color: AppColors.darkBlueThemeColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              //! TOP TRENDING MEETUPS CARDS
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        margin: EdgeInsets.only(right: 20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                  'assets/images/ducati-devil-eyes.jpg',
                                  fit: BoxFit.cover),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                                decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(10)),
                                child: Text("0${index + 1}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                              ),
                            )
                          ],
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

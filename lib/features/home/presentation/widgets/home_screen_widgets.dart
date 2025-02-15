import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';
import 'package:promilo_flutter_app/features/home/controller/home_screen_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 19,
            color: AppColors.darkBlueThemeColor,
          ),
        ));
  }

  static Widget buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 20),
      height: 49,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.darkBlueThemeColor, width: 1.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/search_icon.png',
              color: AppColors.darkBlueThemeColor),
          SizedBox(width: 12),
          Expanded(
            child: Text('Search',
                style: TextStyle(fontSize: 19, color: AppColors.darkGreyColor)),
          ),
          Image.asset('assets/images/microphone_icon.png',
              width: 27, color: AppColors.darkBlueThemeColor),
        ],
      ),
    );
  }

  static Widget buildCarousel(HomeScreenController homeScreenController) {
    return CarouselSlider(
        items: carouselImagesWithText.map((carousel) {
          return Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(carousel['url']!,
                      fit: BoxFit.cover, width: double.infinity)),
              // Black gradient overlay
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment(0.6, 0),
                          colors: [
                        AppColors.blackColor.withValues(alpha: 0.8),
                        Colors.transparent
                      ])),
                ),
              ),
              // Text on top
              Positioned(
                bottom: 25,
                left: 25,
                child: Text(
                  carousel['text']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        options: CarouselOptions(
            onPageChanged: (index, reason) {
              homeScreenController.updateCarouselPage(index);
            },
            viewportFraction: 1.0,
            height: 200,
            autoPlay: true,
            padEnds: false));
  }

  static Widget buildPageIndicator(HomeScreenController homeScreenController) {
    return Obx(
      () => Center(
        child: AnimatedSmoothIndicator(
            activeIndex: homeScreenController.currentPage.toInt(),
            count: carouselImagesWithText.length,
            effect: SlideEffect(
                dotWidth: 12,
                dotHeight: 12,
                activeDotColor: AppColors.darkBlueThemeColor)),
      ),
    );
  }

  static Widget buildTrendingPeopleTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Text(
        'Trending Popular People',
        style: TextStyle(
          color: AppColors.darkBlueThemeColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget buildTrendingPeopleCards() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.greyColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/leaf-logo-trending-people.png',
                      width: 47,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author',
                            style: TextStyle(
                              color: AppColors.darkBlueThemeColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text('1,028 Meetups',
                            style: TextStyle(color: AppColors.darkGreyColor))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 2),
                Divider(thickness: 1.3),
                SizedBox(height: 2),
                Image.asset('assets/images/trending-peoples.png', width: 220),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                        color: AppColors.blueThemeColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'See more',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // List of carousel
  static const List<Map<String, String>> carouselImagesWithText = [
    {
      'url': 'assets/images/carousel_1.jpg',
      'text': 'Popular Meetups\nin India'
    },
    {
      'url': 'assets/images/carousel_2.jpg',
      'text': 'The Ducati Panigale V4 lineup\nmeets code seventeen!'
    },
    {
      'url': 'assets/images/carousel_3.jpg',
      'text': 'The Ducati Panigale V4 lineup\nmeets code seventeen!'
    }
  ];
}

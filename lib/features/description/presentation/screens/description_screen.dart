import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';
import 'package:promilo_flutter_app/features/description/controller/description_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenDescription extends StatelessWidget {
  ScreenDescription({super.key});

  //! INJECTING THE CONTROLLER
  final descriptionScreenController = Get.put(DescriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! APPBAR
      appBar: AppBar(
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
              'Description',
              style: AppTextStyles.promiloText,
            ),
          ),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 19,
                color: AppColors.darkBlueThemeColor,
              ),
            ),
          )),
      backgroundColor: AppColors.whiteColor,
      //! BODY
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! IMAGES SECTION
            Container(
                height: 280,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CarouselSlider(
                          items: carouselImagesWithText.map((carousel) {
                            return Stack(
                              children: [
                                SizedBox(
                                  height: 235,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.asset(carousel['url']!,
                                          fit: BoxFit.cover,
                                          width: double.infinity)),
                                ),
                                // Text on top
                                Positioned(
                                  bottom: 22,
                                  right: MediaQuery.sizeOf(context).width * 0.4,
                                  child: Obx(
                                    () => Center(
                                      child: AnimatedSmoothIndicator(
                                          activeIndex:
                                              descriptionScreenController
                                                  .currentPage
                                                  .toInt(),
                                          count: carouselImagesWithText.length,
                                          effect: SlideEffect(
                                              dotWidth: 12,
                                              dotHeight: 12,
                                              activeDotColor:
                                                  AppColors.whiteColor)),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }).toList(),
                          options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                descriptionScreenController
                                    .updateCarouselPage(index);
                              },
                              viewportFraction: 1.0,
                              height: 235,
                              padEnds: false)),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                              'assets/images/descr_image_1-removebg-preview.png',
                              width: 20),
                          Image.asset(
                              'assets/images/descr_image_2-removebg-preview.png',
                              width: 17),
                          Image.asset(
                              'assets/images/descr_image_3-removebg-preview.png',
                              width: 22),
                          Image.asset(
                              'assets/images/descr_image_4-removebg-preview.png',
                              width: 18),
                          Image.asset(
                              'assets/images/descr_image_5-removebg-preview.png',
                              width: 20),
                          GestureDetector(
                            child: Image.asset(
                                'assets/images/descr_image_6-removebg-preview.png',
                                width: 17),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
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

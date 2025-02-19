import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_flutter_app/core/config/app_colors.dart';
import 'package:promilo_flutter_app/core/config/app_text_styles.dart';
import 'package:promilo_flutter_app/features/description/controller/description_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DescriptionScreenWidgets {
  static buildAppbar() {
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
        ));
  }

  static buildCarouselSection(
      BuildContext context, DescriptionController descriptionScreenController) {
    return Container(
        height: 280,
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CarouselSlider(
                      items: carouselImagesWithText.map((carousel) {
                        return SizedBox(
                          height: 235,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(carousel['url']!,
                                  fit: BoxFit.cover, width: double.infinity)),
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
                // Text on top
                Positioned(
                  bottom: 22,
                  right: MediaQuery.sizeOf(context).width * 0.4,
                  child: Obx(
                    () => Center(
                      child: AnimatedSmoothIndicator(
                          activeIndex:
                              descriptionScreenController.currentPage.toInt(),
                          count: carouselImagesWithText.length,
                          effect: SlideEffect(
                              dotWidth: 12,
                              dotHeight: 12,
                              activeDotColor: AppColors.whiteColor)),
                    ),
                  ),
                )
              ],
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
        ));
  }

  static buildRatingsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        Image.asset('assets/images/descr_image_2-removebg-preview.png',
            width: 12, color: AppColors.blueThemeColor),
        SizedBox(width: 5),
        Text('1034'),
        SizedBox(width: 16),
        Image.asset('assets/images/descr_image_3-removebg-preview.png',
            color: AppColors.blueThemeColor, width: 15),
        SizedBox(width: 5),
        Text('1034'),
        SizedBox(width: 16),
        Image.asset('assets/images/ratings.png', width: 124),
        SizedBox(width: 14),
        Text(
          '3.2',
          style: TextStyle(color: AppColors.blueThemeColor),
        ),
      ],
    );
  }

  static buildActorNameText() {
    return Text('Actor Name', style: AppTextStyles.descriptionHeadingstext);
  }

  static buildDescriptionheading() {
    return Text('Indian Actress', style: AppTextStyles.descriptionSubtext);
  }

  static buildDurationSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.access_time_rounded, color: AppColors.darkGreyColor),
        SizedBox(width: 4),
        Text(
          'Duration 20 Mins',
          style: AppTextStyles.descriptionSubtext,
        )
      ],
    );
  }

  static buildTotalAverageSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.wallet_rounded, color: AppColors.darkGreyColor),
        SizedBox(width: 4),
        Text(
          'Total Average Fees ₹9,999',
          style: AppTextStyles.descriptionSubtext,
        )
      ],
    );
  }

  static buildAboutHeading() {
    return Text('About', style: AppTextStyles.descriptionHeadingstext);
  }

  static buildDescription(DescriptionController descriptionScreenController) {
    return Obx(
      () => GestureDetector(
        onTap: () =>
            descriptionScreenController.updateDescriptionControllerStatus(),
        child: Text(
            maxLines: descriptionScreenController.isExpanded.value ? 3000 : 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            'Sed  perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
            style: AppTextStyles.descriptionSubtext),
      ),
    );
  }

  static buildSeeMoreButton(DescriptionController descriptionScreenController) {
    return GestureDetector(
      onTap: () =>
          descriptionScreenController.updateDescriptionControllerStatus(),
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'See More',
            style: TextStyle(color: AppColors.blueThemeColor, fontSize: 16),
          )),
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

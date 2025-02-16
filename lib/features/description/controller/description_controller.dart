import 'package:get/get.dart';

class DescriptionController extends GetxController {
  // integer to tract current carousel page and update it to dot indicator
  final RxInt currentPage = 0.obs;

  void updateCarouselPage(int index) {
    currentPage.value = index;
  }
}

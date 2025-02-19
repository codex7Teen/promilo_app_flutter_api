import 'package:get/get.dart';

class DescriptionController extends GetxController {
  // integer to tract current carousel page and update it to dot indicator
  final RxInt currentPage = 0.obs;

  // bool to expand and collapse description
  final RxBool isExpanded = false.obs;

  void updateCarouselPage(int index) {
    currentPage.value = index;
  }

  void updateDescriptionControllerStatus() {
    isExpanded.value = !isExpanded.value;
  }
}

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class DescriptionController extends GetxController {
  // integer to tract current carousel page and update it to dot indicator
  final RxInt currentPage = 0.obs;

  // bool to expand and collapse description
  final RxBool isExpanded = false.obs;
// update carousel page index
  void updateCarouselPage(int index) {
    currentPage.value = index;
  }

// description expand and collapse
  void updateDescriptionControllerStatus() {
    isExpanded.value = !isExpanded.value;
  }

// share a dummy image
  void shareContent() {
    Share.share(
        'Book an actor for your next movie/show! https://www.linkedin.com/in/dennis-johnson-flutter-developer/ ');
  }
}

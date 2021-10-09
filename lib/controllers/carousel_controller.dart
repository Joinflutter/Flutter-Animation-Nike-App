import 'package:get/get.dart';

class CarouselController extends GetxController {
  RxInt selectedPage = 0.obs;

  void onPageChange(value) {
    selectedPage.value = value;
    print(value);
  }
}

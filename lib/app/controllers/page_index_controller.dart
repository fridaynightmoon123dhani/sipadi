import 'package:get/get.dart';


import '../routes/app_pages.dart';

class PageIndexController extends GetxController {

  RxInt pageIndex = 0.obs;
  bool firstOpen = false;

  void changePage(int index) async {
    pageIndex.value = index;

    switch (index) {
      case 1:
        Get.offAndToNamed(Routes.HOME);
        break;
      case 2:
        Get.offAllNamed(Routes.HOME);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
        break;
    }
  }
}
//bottom sheets (material nav bottom)
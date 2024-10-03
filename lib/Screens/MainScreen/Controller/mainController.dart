import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
  }
}

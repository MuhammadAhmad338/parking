import 'package:get/get.dart';
import 'package:parking/Screens/MainScreen/Controller/mainController.dart';

class Initialbindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController(), fenix: true);
  }
}

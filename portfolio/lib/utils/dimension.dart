import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double height(double val) {
    return screenHeight / 781 * val;
  }

// screen width of virtual = 392
  static double width(double val) {
    return screenWidth / 392 * val;
  }
}

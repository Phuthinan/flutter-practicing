import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
// x=781/220 [screenHeight / x]
  static double pageViewContainer = screenHeight / 3.55;
  //781/120
  static double pageViewTextContainer = screenHeight / 6.51;

  static double di(double val) {
    return screenHeight / 718 * val;
  }
}

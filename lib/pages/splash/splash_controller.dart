import 'package:get/get.dart';
import '../../routes/common/common_app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    print("Splash Controller Ready");

    Future.delayed(const Duration(seconds: 2), () {
      print("Going to Login Page");
      Get.offAllNamed(routeLoginpage);
    });
  }
}

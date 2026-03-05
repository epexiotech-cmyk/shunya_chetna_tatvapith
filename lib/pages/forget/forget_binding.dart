import 'package:get/get.dart';
import 'package:shunya_app/pages/forget/forget_controller.dart';

class ForgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetController>(() => ForgetController());
  }
}

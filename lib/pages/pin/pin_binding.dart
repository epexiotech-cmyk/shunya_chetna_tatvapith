import 'package:get/get.dart';
import 'package:shunya_app/pages/pin/pin_controller.dart';

class PinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinController>(() => PinController());
  }
}

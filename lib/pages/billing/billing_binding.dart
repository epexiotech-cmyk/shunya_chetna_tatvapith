import 'package:get/get.dart';
import 'package:shunya_app/pages/billing/billing_controller.dart';

class BillingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillingController>(() => BillingController());
  }
}

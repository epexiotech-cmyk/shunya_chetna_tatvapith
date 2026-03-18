import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shunya_app/pages/billing_details/billing_details_controller.dart';

class BillingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillingDetailsController>(() => BillingDetailsController());
  }
}

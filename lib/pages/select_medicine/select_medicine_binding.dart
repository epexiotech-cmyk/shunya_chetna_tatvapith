import 'package:get/get.dart';
import 'package:shunya_app/pages/select_medicine/select_medicine_controller.dart';

class SelectMedicineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectMedicineController>(() => SelectMedicineController());
  }
}

import 'package:get/get.dart';
import 'package:shunya_app/pages/disease/disease_controller.dart';

class DiseaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseController>(() => DiseaseController());
  }
}

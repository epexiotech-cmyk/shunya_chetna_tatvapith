// import 'package:get/get.dart';
// import 'package:shunya_app/pages/patient/patient_controller.dart';

// class PatientBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<PatientController>(() => PatientController());
//   }
// }
import 'package:get/get.dart';
import 'patient_controller.dart';

class PatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientController>(() => PatientController(), fenix: true);
  }
}

import 'package:get/get.dart';
import '../../services/db_service.dart';
import '../../models/clinic_model.dart';
import '../../routes/common/common_app_pages.dart';

// class ClinicController extends GetxController {
//   List<ClinicModel> clinicList = [];

//   @override
//   void onInit() {
//     super.onInit();
//     loadClinics();
//   }

//   /// 🔥 LOAD FROM ISAR
//   Future<void> loadClinics() async {
//     clinicList = await DBService.getClinics();
//     update();
//   }

//   /// 🔥 SELECT CLINIC
//   Future<void> selectClinic(ClinicModel clinic) async {
//     await DBService.updateSelectedClinic(clinic.clinicName);
//     Get.offAllNamed(routedashboard);
//   }
// }
class ClinicController extends GetxController {
  List<ClinicModel> clinicList = [];

  @override
  void onInit() {
    super.onInit();
    loadClinics();
  }

  Future<void> loadClinics() async {
    clinicList = await DBService.getClinics();
    update();
  }

  Future<void> selectClinic(ClinicModel clinic) async {
    /// 🔥 FIX HERE
    await DBService.updateSelectedClinic(clinic.id.toString());

    Get.offAllNamed(routedashboard);
  }
}

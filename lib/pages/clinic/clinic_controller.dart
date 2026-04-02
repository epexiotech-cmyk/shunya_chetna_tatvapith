import 'package:get/get.dart';
import '../../services/db_service.dart';
import '../../models/clinic_model.dart';
import '../../routes/common/common_app_pages.dart';

class ClinicController extends GetxController {
  List<ClinicModel> clinicList = [];

  @override
  void onInit() {
    super.onInit();
    loadClinics();
  }

  /// 🔥 LOAD FROM ISAR
  Future<void> loadClinics() async {
    clinicList = await DBService.getClinics();
    update();
  }

  /// 🔥 SELECT CLINIC
  void selectClinic(ClinicModel clinic) {
    DBService.saveSelectedClinic(clinic);
    Get.offAllNamed(routedashboard);
  }
}

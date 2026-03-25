import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClinicController extends GetxController {
  final box = GetStorage();

  List<ClinicModel> clinicList = [];

  @override
  void onInit() {
    super.onInit();
    loadClinics();
  }

  /// LOAD FROM STORAGE
  void loadClinics() {
    final data = box.read('clinics') ?? [];

    clinicList = (data as List).map((e) {
      return ClinicModel(
        doctorName: e["doctor"] ?? "",
        clinicName: e["name"] ?? "",
        address: e["address"] ?? "",
      );
    }).toList();

    update(); // 🔥 refresh UI
  }

  /// SELECT CLINIC
  void selectClinic(ClinicModel clinic) {
    box.write('selected_clinic', {
      "doctor": clinic.doctorName,
      "name": clinic.clinicName,
      "address": clinic.address,
    });

    Get.offAllNamed('/dashboard');
  }
}

class ClinicModel {
  String doctorName;
  String clinicName;
  String address;

  ClinicModel({
    required this.doctorName,
    required this.clinicName,
    required this.address,
  });
}

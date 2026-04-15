import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shunya_app/models/clinic_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/db_service.dart';
import '../../routes/common/common_app_pages.dart';

class ClinicFormModel {
  TextEditingController clinicnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController doctornameController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController upiidController = TextEditingController();
}

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxList<ClinicFormModel> clinicList = <ClinicFormModel>[ClinicFormModel()].obs;

  /// 🔥 LOAD USER DATA FROM ISAR
  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    final user = await DBService.getUser();

    if (user != null) {
      nameController.text = user.name;
      emailController.text = user.email;
    }
  }

  /// 🔥 UPDATE ONLY MOBILE NUMBER

  /// 🔥 ADD / REMOVE CLINIC
  void addClinic() {
    clinicList.add(ClinicFormModel());
  }

  void removeClinic(int index) {
    clinicList.removeAt(index);
  }

  /// 🔥 UPI VALIDATION
  bool isValidUPI(String upi) {
    final upiRegex = RegExp(r'^[\w.-]+@[\w]+$');
    return upiRegex.hasMatch(upi);
  }

  /// 🔥 VERIFY UPI
  Future<void> verifyUPI(String upi) async {
    if (!isValidUPI(upi)) {
      Get.snackbar("Error", "Invalid UPI format",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    final uri = Uri.parse("upi://pay?pa=$upi&pn=Test&am=1&cu=INR");

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// 🔥 EXTRACT UPI FROM QR
  String? extractUPI(String rawData) {
    try {
      final uri = Uri.parse(rawData);
      return uri.queryParameters['pa'];
    } catch (e) {
      return null;
    }
  }

  /// 🔥 SCANNER
  void openScanner(int index) {
    Get.to(
      () => Scaffold(
        appBar: AppBar(title: const Text("Scan UPI QR")),
        body: MobileScanner(
          onDetect: (barcode) {
            final String? raw = barcode.barcodes.first.rawValue;

            if (raw != null) {
              Get.back();

              String? upi = extractUPI(raw);

              if (upi != null) {
                clinicList[index].upiidController.text = upi;

                Get.snackbar("Success", "UPI detected: $upi",
                    backgroundColor: Colors.green, colorText: Colors.white);

                verifyUPI(upi);
              } else {
                Get.snackbar("Error", "Invalid UPI QR",
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> saveclinic() async {
    List<ClinicModel> clinics = [];

    for (var c in clinicList) {
      if (c.clinicnameController.text.trim().isNotEmpty &&
          c.doctornameController.text.trim().isNotEmpty) {
        clinics.add(
          ClinicModel()
            ..clinicName = c.clinicnameController.text.trim()
            ..doctorName = c.doctornameController.text.trim()
            ..address = c.addressController.text.trim()
            ..mobile = c.mobileController.text.trim()
            ..upiId = c.upiidController.text.trim()
            ..qualification = c.qualificationController.text.trim(),
        );
      }
    }

    if (clinics.isEmpty) {
      Get.snackbar("Error", "Add at least one clinic");
      return;
    }

    /// 🔥 SAVE ALL CLINICS
    await DBService.saveClinics(clinics);

    /// 🔥 VERY IMPORTANT: SET FIRST CLINIC AS SELECTED
    await DBService.updateSelectedClinic(clinics.first.clinicName);

    /// 🔥 NAVIGATION
    if (clinics.length == 1) {
      Get.offAllNamed(routedashboard);
    } else {
      Get.offAllNamed(routeclinicpage);
    }
  }
}

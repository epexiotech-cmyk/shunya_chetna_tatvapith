import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shunya_app/auth_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class ClinicModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController doctornameController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController upiidController = TextEditingController();
}

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    final user = AuthController().getUser();

    if (user != null) {
      nameController.text = user['name'] ?? "";
      emailController.text = user['email'] ?? "";
      mobileController.text = user['mobile'] ?? "";
    }
  }

  RxList<ClinicModel> clinicList = <ClinicModel>[ClinicModel()].obs;

  void addClinic() {
    clinicList.add(ClinicModel());
  }

  void removeClinic(int index) {
    clinicList.removeAt(index);
  }

  /// ✅ UPI VALIDATION
  bool isValidUPI(String upi) {
    final upiRegex = RegExp(r'^[\w.-]+@[\w]+$');
    return upiRegex.hasMatch(upi);
  }

  /// ✅ VERIFY UPI
  Future<void> verifyUPI(String upi) async {
    if (!isValidUPI(upi)) {
      Get.snackbar(
        "Error",
        "Invalid UPI format",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final uri = Uri.parse("upi://pay?pa=$upi&pn=Test&am=1&cu=INR");

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// ✅ EXTRACT UPI FROM QR
  String? extractUPI(String rawData) {
    try {
      final uri = Uri.parse(rawData);
      return uri.queryParameters['pa'];
    } catch (e) {
      return null;
    }
  }

  /// ✅ OPEN SCANNER (NO NEW FILE)
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

                Get.snackbar(
                  "Success",
                  "UPI detected: $upi",
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );

                verifyUPI(upi);
              } else {
                Get.snackbar(
                  "Error",
                  "Invalid UPI QR",
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            }
          },
        ),
      ),
    );
  }

  /// ✅ SAVE VALIDATION
  void saveProfile() {
    // for (var clinic in clinicList) {
    //   String upi = clinic.upiidController.text.trim();

    //   if (upi.isEmpty || !isValidUPI(upi)) {
    //     Get.snackbar(
    //       "Invalid UPI",
    //       "Please enter valid UPI ID",
    //       backgroundColor: Colors.red,
    //       colorText: Colors.white,
    //     );
    //     return;
    //   }
    // }

    // Get.snackbar(
    //   "Success",
    //   "Profile Saved",
    //   backgroundColor: Colors.green,
    //   colorText: Colors.white,
    // );

    final box = GetStorage();

    /// PROFILE COMPLETE
    box.write('profile_complete', true);

    /// SAVE CLINICS
    List clinics = clinicList.map((c) {
      return {
        "doctor": c.doctornameController.text,
        "name": c.nameController.text,
        "address": c.addressController.text,
        "upi": c.upiidController.text,
      };
    }).toList();

    box.write('clinics', clinics);

    /// FLOW DECISION
    if (clinics.length == 1) {
      box.write('selected_clinic', clinics.first);
      Get.offAllNamed(routedashboard);
    } else {
      Get.offAllNamed(routeclinicpage);
    }
  }
}

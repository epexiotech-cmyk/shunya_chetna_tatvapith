// import 'package:get/get.dart';
// import 'package:open_file/open_file.dart';
// import 'package:url_launcher/url_launcher.dart';

// class BillingDetailsController extends GetxController {
//   /// DOCTOR DETAILS
//   String doctorName = "Rahul Patel";
//   String clinicName = "Shunya Chetna Tatvapith";
//   String clinicAddress = "Vadodara, Gujarat";
//   String doctorMobile = "7572855882";

//   /// UPI ID
//   String doctorUPI = "rahulpatel@upi";

//   /// BILL DETAILS
//   String billNo = "";
//   String billDate =
//       "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

//   /// PATIENT DETAILS
//   String patientName = "";
//   String patientMobile = "";
//   String patientCity = "";

//   /// 🔥 MEDICINE LIST (NOW DYNAMIC)
//   List<Map<String, dynamic>> medicineList = [];

//   @override
//   void onInit() {
//     super.onInit();
//     generateBillNo();
//     final args = Get.arguments;

//     if (args != null) {
//       /// 🔥 MODE CHECK
//       isHistory = args["isHistory"] ?? false;

//       /// 🔥 PATIENT
//       final patient = args["patient"];

//       patientName = patient.name ?? "";
//       patientMobile = patient.mobile ?? "";
//       patientCity = patient.village ?? "";

//       /// 🔥 BILL MODE
//       if (!isHistory) {
//         currentVisit = args["visit"];

//         medicineList = List<Map<String, dynamic>>.from(
//           args["medicines"] ?? [],
//         );
//       }

//       /// 🔥 HISTORY MODE
//       else {
//         visitList = args["visits"] ?? [];
//       }
//     }
//   }

//   void generateBillNo() {
//     final now = DateTime.now();

//     int startYear;
//     int endYear;

//     if (now.month >= 4) {
//       startYear = now.year;
//       endYear = now.year + 1;
//     } else {
//       startYear = now.year - 1;
//       endYear = now.year;
//     }

//     String fy =
//         "${startYear.toString().substring(2)}-${endYear.toString().substring(2)}";

//     /// 🔥 TEMP: static counter (later DB thi laisu)
//     int count = DateTime.now().millisecondsSinceEpoch % 1000;

//     String serial = count.toString().padLeft(3, '0');

//     billNo = "PMS/$fy/$serial";
//   }

//   /// 🔥 TOTAL
//   int get totalAmount {
//     int total = 0;

//     for (var med in medicineList) {
//       int qty = int.tryParse(med["qty"].toString()) ?? 0;
//       int price = int.tryParse(med["price"].toString()) ?? 0;

//       total += qty * price;
//     }

//     return total;
//   }

//   /// 🔥 UPI QR
//   String get upiUrl {
//     return "upi://pay?pa=$doctorUPI"
//         "&pn=$doctorName"
//         "&am=$totalAmount"
//         "&cu=INR";
//   }

//   /// 🔥 WHATSAPP MESSAGE (DYNAMIC)
//   String getWhatsAppMessage() {
//     String medicineText = "";

//     for (var med in medicineList) {
//       medicineText +=
//           "${med["name"]} (${med["qty"]}) - ₹${(int.tryParse(med["qty"].toString()) ?? 0) * (int.tryParse(med["price"].toString()) ?? 0)}\n";
//     }

//     return '''
// Dear $patientName,

// Your bill is generated.

// Bill No: $billNo
// Date: $billDate

// Medicines:
// $medicineText

// Total Amount: ₹$totalAmount

// Thank you!
// ''';
//   }

//   /// 🔥 WHATSAPP SEND
//   Future<void> sendWhatsAppMessage() async {
//     final message = Uri.encodeComponent(getWhatsAppMessage());

//     final url = Uri.parse("https://wa.me/91$patientMobile?text=$message");

//     await launchUrl(url, mode: LaunchMode.externalApplication);
//   }

//   bool isHistory = false;
//   List<dynamic> visitList = [];
//   dynamic currentVisit;

//   Future<void> openPdf(String path) async {
//     await OpenFile.open(path);
//   }
// }

import 'dart:convert';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:shunya_app/models/patient_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/db_service.dart';
import '../../models/clinic_model.dart';

class BillingDetailsController extends GetxController {
  /// 🔥 SELECTED CLINIC
  ClinicModel? selectedClinic;

  /// 🔥 DOCTOR / CLINIC DETAILS (DYNAMIC)
  String doctorName = "";
  String clinicName = "";
  String clinicAddress = "";
  String doctorMobile = "";
  String doctorUPI = "";

  /// 🔥 BILL DETAILS
  String billNo = "";
  String billDate =
      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  /// 🔥 PATIENT DETAILS
  String patientName = "";
  String patientMobile = "";
  String patientCity = "";

  /// 🔥 MEDICINE LIST
  List<Map<String, dynamic>> medicineList = [];

  /// 🔥 HISTORY MODE
  bool isHistory = false;
  List<dynamic> visitList = [];
  dynamic currentVisit;

  @override
  void onInit() async {
    super.onInit();

    generateBillNo();

    /// 🔥 LOAD SELECTED CLINIC
    final clinicId = await DBService.getSelectedClinicId();

    if (clinicId != null) {
      selectedClinic = await DBService.getClinicById(clinicId);

      if (selectedClinic != null) {
        doctorName = selectedClinic!.doctorName ?? "";
        clinicName = selectedClinic!.clinicName ?? "";
        clinicAddress = selectedClinic!.address ?? "";
        doctorMobile = selectedClinic!.mobile ?? "";
        doctorUPI = selectedClinic!.upiId ?? "";
      }
    }

    /// 🔥 GET ARGUMENTS
    final args = Get.arguments;

    /// 🔥 NEW ADD (safe)
    if (args != null &&
        args["patient_id"] != null &&
        args["visit_id"] != null) {
      await loadFromDB(args["patient_id"], args["visit_id"]);
    }

    if (args != null) {
      isHistory = args["isHistory"] ?? false;

      final patient = args["patient"];

      patientName = patient.name ?? "";
      patientMobile = patient.mobile ?? "";
      patientCity = patient.village ?? "";

      if (!isHistory) {
        currentVisit = args["visit"];

        medicineList = List<Map<String, dynamic>>.from(
          args["medicines"] ?? [],
        );
      } else {
        visitList = args["visits"] ?? [];
      }
    }

    update(); // 🔥 UI refresh
  }

  /// 🔥 GENERATE BILL NUMBER
  void generateBillNo() {
    final now = DateTime.now();

    int startYear;
    int endYear;

    if (now.month >= 4) {
      startYear = now.year;
      endYear = now.year + 1;
    } else {
      startYear = now.year - 1;
      endYear = now.year;
    }

    String fy =
        "${startYear.toString().substring(2)}-${endYear.toString().substring(2)}";

    int count = DateTime.now().millisecondsSinceEpoch % 1000;
    String serial = count.toString().padLeft(3, '0');

    billNo = "PMS/$fy/$serial";
  }

  /// 🔥 TOTAL CALCULATION
  int get totalAmount {
    int total = 0;

    for (var med in medicineList) {
      int qty = int.tryParse(med["qty"].toString()) ?? 0;
      int price = int.tryParse(med["price"].toString()) ?? 0;

      total += qty * price;
    }

    return total;
  }

  /// 🔥 UPI URL (DYNAMIC)
  String get upiUrl {
    return "upi://pay?pa=$doctorUPI"
        "&pn=$doctorName"
        "&am=$totalAmount"
        "&cu=INR";
  }

  /// 🔥 WHATSAPP MESSAGE
  String getWhatsAppMessage() {
    String medicineText = "";

    for (var med in medicineList) {
      int qty = int.tryParse(med["qty"].toString()) ?? 0;
      int price = int.tryParse(med["price"].toString()) ?? 0;

      medicineText += "${med["name"]} ($qty) - ₹${qty * price}\n";
    }

    return '''
Dear $patientName,

Your bill is generated.

Bill No: $billNo
Date: $billDate

Clinic: $clinicName
Doctor: $doctorName

Medicines:
$medicineText

Total Amount: ₹$totalAmount

Thank you!
''';
  }

  /// 🔥 SEND WHATSAPP
  Future<void> sendWhatsAppMessage() async {
    final message = Uri.encodeComponent(getWhatsAppMessage());

    final url = Uri.parse("https://wa.me/91$patientMobile?text=$message");

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  /// 🔥 OPEN PDF
  Future<void> openPdf(String path) async {
    await OpenFile.open(path);
  }

  Future<void> loadFromDB(int patientId, int visitId) async {
    /// 🔹 Patient
    final patient = await DBService.isar.patientModels.get(patientId);

    if (patient != null) {
      patientName = patient.name ?? "";
      patientMobile = patient.mobile ?? "";
      patientCity = patient.address ?? "";
    }

    /// 🔹 Visit
    final visits = await DBService.getVisits(patientId);

    final visit = visits.firstWhere((v) => v.id == visitId);

    billDate = visit.date?.toString() ?? "";

    /// 🔥 Medicines JSON
    if (visit.medicinesJson != null) {
      medicineList = List<Map<String, dynamic>>.from(
        jsonDecode(visit.medicinesJson!),
      );
    }
  }
}

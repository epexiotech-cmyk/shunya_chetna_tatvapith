import 'dart:convert';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/patient_model.dart';
import '../../models/visit_model.dart';
import '../../services/db_service.dart';
import '../../models/clinic_model.dart';

class BillingDetailsController extends GetxController {
  /// 🔥 SELECTED CLINIC
  ClinicModel? selectedClinic;

  /// 🔥 DOCTOR / CLINIC DETAILS
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

    /// 🔥 LOAD CLINIC
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

    /// ===============================
    /// 🔥 CASE 1: BILLING LIST → DB LOAD
    /// ===============================
    if (args != null &&
        args["patient_id"] != null &&
        args["visit_id"] != null) {
      await loadFromDB(args["patient_id"], args["visit_id"]);
      update();
      return;
    }

    /// ===============================
    /// 🔥 CASE 2: HISTORY MODE
    /// ===============================
    if (args != null && args["isHistory"] == true) {
      isHistory = true;

      final patient = args["patient"];

      patientName = patient.name ?? "";
      patientMobile = patient.mobile ?? "";
      patientCity = patient.village ?? "";

      visitList = args["visits"] ?? [];

      update();
      return;
    }

    /// ===============================
    /// 🔥 CASE 3: DIRECT VISIT
    /// ===============================
    if (args != null && args["visit"] != null && args["patient"] != null) {
      final patient = args["patient"];
      final visit = args["visit"];

      patientName = patient.name ?? "";
      patientMobile = patient.mobile ?? "";
      patientCity = patient.village ?? "";

      /// 🔥 medicines load
      if (visit.medicinesJson != null) {
        medicineList = List<Map<String, dynamic>>.from(
          jsonDecode(visit.medicinesJson),
        );
      }

      update();
      return;
    }
  }

  /// 🔥 LOAD FROM DB
  Future<void> loadFromDB(int patientId, int visitId) async {
    final patient =
        await DBService.isar.collection<PatientModel>().get(patientId);

    if (patient != null) {
      patientName = patient.name ?? "";
      patientMobile = patient.mobile ?? "";
      patientCity = patient.address ?? "";
    }

    final visits = await DBService.isar
        .collection<VisitModel>()
        .filter()
        .patientIdEqualTo(patientId)
        .findAll();

    final visit = visits.firstWhere((v) => v.id == visitId);

    billDate = visit.date?.toString() ?? "";

    if (visit.medicinesJson != null) {
      medicineList = List<Map<String, dynamic>>.from(
        jsonDecode(visit.medicinesJson!),
      );
    }
  }

  /// 🔥 BILL NUMBER
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

  /// 🔥 TOTAL
  int get totalAmount {
    int total = 0;

    for (var med in medicineList) {
      int qty = int.tryParse(med["qty"].toString()) ?? 0;
      int price = int.tryParse(med["price"].toString()) ?? 0;

      total += qty * price;
    }

    return total;
  }

  /// 🔥 UPI
  String get upiUrl {
    return "upi://pay?pa=$doctorUPI"
        "&pn=$doctorName"
        "&am=$totalAmount"
        "&cu=INR";
  }

  /// 🔥 WHATSAPP
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
}

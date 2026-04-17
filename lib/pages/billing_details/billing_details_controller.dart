import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BillingDetailsController extends GetxController {
  /// DOCTOR DETAILS
  String doctorName = "Rahul Patel";
  String clinicName = "Shunya Chetna Tatvapith";
  String clinicAddress = "Vadodara, Gujarat";
  String doctorMobile = "7572855882";

  /// UPI ID
  String doctorUPI = "rahulpatel@upi";

  /// BILL DETAILS
  String billNo = "PAT${DateTime.now().millisecondsSinceEpoch}";
  String billDate =
      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  /// PATIENT DETAILS
  String patientName = "";
  String patientMobile = "";
  String patientCity = "";

  /// 🔥 MEDICINE LIST (NOW DYNAMIC)
  List<Map<String, dynamic>> medicineList = [];

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    if (args != null) {
      /// 🔥 PATIENT DATA
      final patient = args["patient"];

      patientName = patient["name"] ?? "";
      patientMobile = patient["mobile"] ?? "";
      patientCity = patient["village"] ?? "";

      /// 🔥 MEDICINE DATA
      medicineList = List<Map<String, dynamic>>.from(
        args["medicines"] ?? [],
      );
    }
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

  /// 🔥 UPI QR
  String get upiUrl {
    return "upi://pay?pa=$doctorUPI"
        "&pn=$doctorName"
        "&am=$totalAmount"
        "&cu=INR";
  }

  /// 🔥 WHATSAPP MESSAGE (DYNAMIC)
  String getWhatsAppMessage() {
    String medicineText = "";

    for (var med in medicineList) {
      medicineText +=
          "${med["name"]} (${med["qty"]}) - ₹${(int.tryParse(med["qty"].toString()) ?? 0) * (int.tryParse(med["price"].toString()) ?? 0)}\n";
    }

    return '''
Dear $patientName,

Your bill is generated.

Bill No: $billNo
Date: $billDate

Medicines:
$medicineText

Total Amount: ₹$totalAmount

Thank you!
''';
  }

  /// 🔥 WHATSAPP SEND
  Future<void> sendWhatsAppMessage() async {
    final message = Uri.encodeComponent(getWhatsAppMessage());

    final url = Uri.parse("https://wa.me/91$patientMobile?text=$message");

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}

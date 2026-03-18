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
  String billNo = "PAT001";
  String billDate = "01/01/2026";

  /// PATIENT DETAILS
  String patientName = "Ramesh Patel";
  String patientMobile = "9714384251";
  String patientCity = "Vadodara";

  /// MEDICINE LIST
  List<Map<String, dynamic>> medicineList = [
    {"name": "GM", "qty": 3, "price": 1, "use": "1-1"},
    {"name": "AGMR", "qty": 3, "price": 1, "use": "1(M)"},
    {"name": "GBM", "qty": 3, "price": 2, "use": "1-1-1"},
  ];

  /// TOTAL
  int get totalAmount {
    int total = 0;

    for (var med in medicineList) {
      int qty = med["qty"] as int;
      int price = med["price"] as int;

      total += qty * price; // ✅ correct
    }

    return total;
  }

  /// UPI QR STRING
  String get upiUrl {
    return "upi://pay?pa=$doctorUPI"
        "&pn=$doctorName"
        "&am=$totalAmount"
        "&cu=INR";
  }

  String getWhatsAppMessage() {
    return '''
Dear $patientName,

Your bill is generated.

Bill No: $billNo
Date: $billDate
Amount: ₹$totalAmount

Download Bill:
https://drive.google.com/file/d/1ilBe7aaRNyNOkX3mPODoa84Xu2-Gv1x6/view?usp=sharing

Thank you!
''';
  }

  Future<void> sendWhatsAppMessage() async {
    final message = Uri.encodeComponent(getWhatsAppMessage());

    final url = Uri.parse("https://wa.me/91${9974457934}?text=$message");

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}

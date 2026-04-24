import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/db_service.dart';

class BillingController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  var billingList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBilling();
  }

  /// 🔥 VISIT BASED BILLING LIST
  void loadBilling() async {
    final user = await DBService.getUser();
    if (user == null) return;

    final patients = await DBService.getPatients(user.firebaseUid ?? "");

    List<Map<String, dynamic>> list = [];

    for (var patient in patients) {
      final visits = await DBService.getVisits(patient.id);

      for (var visit in visits) {
        list.add({
          "patient_id": patient.id,
          "visit_id": visit.id,
          "name": patient.name ?? "",
          "mobile": patient.mobile ?? "",
          "address": patient.address ?? "",
          "date": visit.date.toString(),
        });
      }
    }

    /// latest first
    list.sort((a, b) => b["visit_id"].compareTo(a["visit_id"]));

    billingList.value = list;
  }
}

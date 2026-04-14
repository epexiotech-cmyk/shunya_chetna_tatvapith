import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/disease_model.dart';
import '../../services/db_service.dart';

class DiseaseController extends GetxController {
  TextEditingController adddiseasecontroller = TextEditingController();

  /// 🔥 ISAR LIST
  RxList<DiseaseModel> diseaseList = <DiseaseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDiseases();
  }

  /// 🔥 LOAD
  Future<void> loadDiseases() async {
    final user = await DBService.getUser();
    if (user == null) return;

    final data = await DBService.getDiseases(user.firebaseUid);
    diseaseList.assignAll(data);
  }

  /// 🔥 ADD DISEASE
  Future<void> addDisease() async {
    String name = adddiseasecontroller.text.trim();

    if (name.isEmpty) {
      Get.snackbar("Error", "Enter disease name");
      return;
    }

    final user = await DBService.getUser();
    if (user == null) return;

    final disease = DiseaseModel()
      ..userId = user.firebaseUid
      ..name = name;

    await DBService.saveDisease(disease);

    adddiseasecontroller.clear();

    Get.back(result: true);

    loadDiseases();
  }

  /// 🔥 DELETE
  Future<void> deleteDiseaseById(int id) async {
    await DBService.deleteDisease(id);

    Get.snackbar("Success", "Disease Deleted");

    loadDiseases();
  }

  @override
  void onClose() {
    adddiseasecontroller.dispose();
    super.onClose();
  }
}

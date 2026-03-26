import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DiseaseController extends GetxController
    with GetTickerProviderStateMixin {
  final box = GetStorage();

  TextEditingController adddiseasecontroller = TextEditingController();

  RxList<Map<String, dynamic>> diseaseList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDiseases();
  }

  /// LOAD FROM STORAGE
  void loadDiseases() {
    final data = box.read('diseases') ?? [];

    diseaseList.value = List<Map<String, dynamic>>.from(data);
  }

  /// ADD DISEASE
  void addDisease() {
    String name = adddiseasecontroller.text.trim();

    if (name.isEmpty) {
      Get.snackbar("Error", "Enter disease name");
      return;
    }

    diseaseList.add({"name": name});

    box.write('diseases', diseaseList); // 🔥 SAVE

    adddiseasecontroller.clear();

    Get.back();
    update();
  }

  /// DELETE DISEASE
  void deleteDisease(int index) {
    diseaseList.removeAt(index);

    box.write('diseases', diseaseList); // 🔥 UPDATE STORAGE
  }

  @override
  void onClose() {
    adddiseasecontroller.dispose();
    super.onClose();
  }
}

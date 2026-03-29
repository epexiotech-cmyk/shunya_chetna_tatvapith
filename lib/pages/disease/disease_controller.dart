import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DiseaseController extends GetxController
    with GetTickerProviderStateMixin {


  TextEditingController adddiseasecontroller = TextEditingController();

  RxList<Map<String, dynamic>> diseaseList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

  }

  
  /// ADD DISEASE
  void addDisease() {
    String name = adddiseasecontroller.text.trim();

    if (name.isEmpty) {
      Get.snackbar("Error", "Enter disease name");
      return;
    }

   
    adddiseasecontroller.clear();

    Get.back();
    update();
  }

  /// DELETE DISEASE
  void deleteDisease(int index) {
    diseaseList.removeAt(index);


  }

  @override
  void onClose() {
    adddiseasecontroller.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClinicModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
}

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();

  RxList<ClinicModel> clinicList = <ClinicModel>[ClinicModel()].obs;

  void addClinic() {
    clinicList.add(ClinicModel());
  }

  void removeClinic(int index) {
    clinicList.removeAt(index);
  }
}

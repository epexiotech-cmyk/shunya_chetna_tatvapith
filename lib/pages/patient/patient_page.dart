import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/patient/patient_controller.dart';
import 'package:shunya_app/utils/colors.dart';

class PatientPage extends GetView<PatientController> {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Center(
        child: Text(
          "Welcome Patient",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

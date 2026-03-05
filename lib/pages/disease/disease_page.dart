import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/disease/disease_controller.dart';
import 'package:shunya_app/utils/colors.dart';

class DiseasePage extends GetView<DiseaseController> {
  const DiseasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Center(
        child: Text(
          "Welcome Disease",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

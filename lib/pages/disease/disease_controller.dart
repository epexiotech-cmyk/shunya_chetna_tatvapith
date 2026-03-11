import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseController extends GetxController
    with GetTickerProviderStateMixin {
  /// Add Diseasecontroller

  TextEditingController adddiseasecontroller = TextEditingController();

  /// disease list page

  RxList<Map<String, String>> diseaseList = [
    {"name": "Fever"},
    {"name": "Cold"},
    {"name": "Cough"},
    {"name": "Headache"},
    {"name": "Migraine"},
    {"name": "Diabetes"},
    {"name": "Hypertension"},
    {"name": "Asthma"},
    {"name": "Allergy"},
    {"name": "Skin Infection"},
    {"name": "Stomach Pain"},
    {"name": "Gastritis"},
    {"name": "Vomiting"},
    {"name": "Diarrhea"},
    {"name": "Arthritis"},
    {"name": "Back Pain"},
    {"name": "Throat Infection"},
    {"name": "Eye Infection"},
    {"name": "Ear Pain"},
    {"name": "Dental Pain"},
  ].obs;

  /// Delete single disease
  void deleteDisease(int index) {
    diseaseList.removeAt(index);
  }
}

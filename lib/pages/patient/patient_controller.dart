import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientController extends GetxController
    with GetTickerProviderStateMixin {
  // add patient page
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController maritalstatusController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController hightController = TextEditingController();
  DateTime? selectedDate;

  Future<void> pickDate({required BuildContext context}) async {
    DateTime now = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;

      print("pickedDate  ::: $pickedDate");
      dobController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";

      update();
    }
  }

  RxString selectedGender = "Male".obs;

  void changeGender(String value) {
    selectedGender.value = value;
  }

  RxString maritalStatus = "Unmarried".obs;

  void changeMaritalStatus(String value) {
    maritalStatus.value = value;
  }

  RxString selectedBloodGroup = "".obs;

  List<String> bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];

  void changeBloodGroup(String value) {
    selectedBloodGroup.value = value;
  }

  /// patient page list

  TextEditingController searchController = TextEditingController();
  RxList<Map<String, String>> patientList = [
    {"name": "Ramesh Patel", "mobile": "9876543210", "address": "Vadodara"},
    {"name": "Suresh Shah", "mobile": "9825147852", "address": "Ahmedabad"},
    {"name": "Mahesh Joshi", "mobile": "9874563210", "address": "Surat"},
    {"name": "Ketan Desai", "mobile": "9898765432", "address": "Rajkot"},
    {"name": "Amit Mehta", "mobile": "9812345678", "address": "Bhavnagar"},
    {"name": "Dharmesh Shah", "mobile": "9901234567", "address": "Anand"},
    {"name": "Nilesh Parmar", "mobile": "9871204563", "address": "Nadiad"},
    {
      "name": "Hardik Patel",
      "mobile": "9898123456",
      "address": "Surendranagar",
    },
    {"name": "Jignesh Shah", "mobile": "9811123456", "address": "Gandhinagar"},
    {"name": "Rajesh Trivedi", "mobile": "9874567890", "address": "Palanpur"},
    {"name": "Bhavesh Patel", "mobile": "9898989898", "address": "Mehsana"},
    {"name": "Hitesh Shah", "mobile": "9876547890", "address": "Junagadh"},
    {"name": "Vikas Patel", "mobile": "9822233344", "address": "Amreli"},
    {"name": "Parth Mehta", "mobile": "9811198765", "address": "Botad"},
    {"name": "Rohit Shah", "mobile": "9898111122", "address": "Morbi"},
    {"name": "Manish Patel", "mobile": "9873216540", "address": "Porbandar"},
    {"name": "Alpesh Desai", "mobile": "9812340098", "address": "Valsad"},
    {"name": "Yogesh Shah", "mobile": "9898001122", "address": "Navsari"},
    {"name": "Tushar Patel", "mobile": "9870001234", "address": "Bharuch"},
    {"name": "Chirag Mehta", "mobile": "9812345670", "address": "Dahod"},
  ].obs;
}

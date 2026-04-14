// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';

// class PatientController extends GetxController
//     with GetTickerProviderStateMixin {
//   // add patient page
//   TextEditingController nameController = TextEditingController();
//   TextEditingController genderController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController bloodController = TextEditingController();
//   TextEditingController maritalstatusController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController villageController = TextEditingController();
//   TextEditingController weightController = TextEditingController();
//   TextEditingController hightController = TextEditingController();
//   TextEditingController bpcountController = TextEditingController();
//   TextEditingController sugerlavelController = TextEditingController();
//   TextEditingController patientobservationlavelController =
//       TextEditingController();
//   TextEditingController patientproblemController = TextEditingController();
//   RxBool isEditMode = false.obs;
//   int? editIndex;
//   DateTime? selectedDate;

//   Future<void> pickDate({required BuildContext context}) async {
//     DateTime now = DateTime.now();

//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? now,
//       firstDate: DateTime(1900),
//       lastDate: now,
//     );

//     if (pickedDate != null) {
//       selectedDate = pickedDate;

//       dobController.text =
//           "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";

//       update();
//     }
//   }

//   RxString selectedGender = "Male".obs;

//   void changeGender(String value) {
//     selectedGender.value = value;
//   }

//   RxString maritalStatus = "Unmarried".obs;

//   void changeMaritalStatus(String value) {
//     maritalStatus.value = value;
//   }

//   RxString selectedBloodGroup = "".obs;

//   List<String> bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];

//   void changeBloodGroup(String value) {
//     selectedBloodGroup.value = value;
//   }

//   /// patient page list

//   TextEditingController searchController = TextEditingController();

//   final ImagePicker _picker = ImagePicker();

//   RxList<File> selectedImages = <File>[].obs;
//   Rx<File?> generatedPdf = Rx<File?>(null);

//   /// 📸 MULTIPLE IMAGE PICK + AUTO PDF
//   // RxList<File> pdfList = <File>[].obs;

//   /// 📸 MULTI IMAGE → DIRECT PDF
//   Future<void> pickMultipleImages() async {
//     final List<XFile> images = await _picker.pickMultiImage();

//     if (images.isEmpty) return;

//     await createPdfFromImages(images.map((e) => File(e.path)).toList());
//   }

//   /// 🧾 CREATE PDF (BATCH WISE)
//   Future<void> createPdfFromImages(List<File> images) async {
//     final pdf = pw.Document();

//     for (var img in images) {
//       final image = pw.MemoryImage(img.readAsBytesSync());

//       pdf.addPage(
//         pw.Page(
//           build: (context) {
//             return pw.Center(child: pw.Image(image));
//           },
//         ),
//       );
//     }

//     final dir = await getApplicationDocumentsDirectory();

//     final file = File(
//       "${dir.path}/patient_${DateTime.now().millisecondsSinceEpoch}.pdf",
//     );

//     await file.writeAsBytes(await pdf.save());

//     /// ✅ ADD NEW PDF TO LIST
//     pdfList.add(file);

//     Get.snackbar("Success", "PDF Created");
//   }

//   /// 📄 PICK ONLY PDF
//   RxList<File> pdfList = <File>[].obs;

//   /// 📄 MULTIPLE PDF PICK
//   Future<void> pickMultiplePdf() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//       allowMultiple: true,
//     );

//     if (result != null) {
//       pdfList.addAll(result.files.map((e) => File(e.path!)).toList());

//       Get.snackbar("Success", "PDFs Uploaded");
//     }
//   }

//   void removePdf(int index) {
//     pdfList.removeAt(index);
//   }

//   /// 📄 OPEN PDF IN EXTERNAL APP
//   Future<void> openPdf(File file) async {
//     final result = await OpenFile.open(file.path);

//     if (result.type != ResultType.done) {
//       Get.snackbar("Error", "No app found to open PDF");
//     }
//   }

//   void setPatientData(Map<String, String> patient, int index) {
//     isEditMode.value = true;
//     editIndex = index;

//     nameController.text = patient["name"] ?? "";
//     mobileController.text = patient["mobile"] ?? "";
//     dobController.text = patient["dob"] ?? "";
//     ageController.text = patient["age"] ?? "";
//     addressController.text = patient["address"] ?? "";
//     villageController.text = patient["village"] ?? "";
//     weightController.text = patient["weight"] ?? "";
//     hightController.text = patient["height"] ?? "";
//     bpcountController.text = patient["bpCount"] ?? "";
//     sugerlavelController.text = patient["sugarLevel"] ?? "";

//     selectedGender.value = patient["gender"] ?? "Male";
//     selectedBloodGroup.value = patient["bloodGroup"] ?? "";
//     maritalStatus.value = patient["maritalStatus"] ?? "Unmarried";
//   }

//   RxList patientList = [].obs;

//   void savePatientTemp() {
//     final data = {
//       "name": nameController.text,
//       "mobile": mobileController.text,
//       "gender": selectedGender.value,
//       "dob": dobController.text,
//       "age": ageController.text,
//       "bloodGroup": selectedBloodGroup.value,
//       "maritalStatus": maritalStatus.value,
//       "village": villageController.text,
//       "address": addressController.text,
//       "weight": weightController.text,
//       "height": hightController.text,
//       "bpCount": bpcountController.text,
//       "sugarLevel": sugerlavelController.text,
//     };

//     if (isEditMode.value && editIndex != null) {
//       /// 🔄 UPDATE
//       patientList[editIndex!] = data;
//     } else {
//       /// ➕ ADD
//       patientList.add(data);
//     }

//     clearForm();

//     Get.back();
//   }

//   void clearForm() {
//     nameController.clear();
//     mobileController.clear();
//     dobController.clear();
//     ageController.clear();
//     addressController.clear();
//     villageController.clear();
//     weightController.clear();
//     hightController.clear();
//     bpcountController.clear();
//     sugerlavelController.clear();

//     selectedGender.value = "Male";
//     selectedBloodGroup.value = "";
//     maritalStatus.value = "Unmarried";

//     isEditMode.value = false;
//     editIndex = null;
//   }
// }

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import '../../models/patient_model.dart';
import '../../services/db_service.dart';

class PatientController extends GetxController
    with GetTickerProviderStateMixin {
  /// 🔥 FORM CONTROLLERS
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController hightController = TextEditingController();
  TextEditingController bpcountController = TextEditingController();
  TextEditingController sugerlavelController = TextEditingController();

  /// 🔥 ADD THESE (REQUIRED FOR UI)

  TextEditingController patientobservationlavelController =
      TextEditingController();

  TextEditingController patientproblemController = TextEditingController();

  /// 🔥 PDF STATUS (FOR UI)
  Rx<File?> generatedPdf = Rx<File?>(null);

  /// 🔥 EDIT MODE
  RxBool isEditMode = false.obs;
  int? editIndex;

  /// 🔥 DATE
  DateTime? selectedDate;

  Future<void> pickDate({required BuildContext context}) async {
    DateTime now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;

      dobController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";

      update();
    }
  }

  /// 🔥 DROPDOWNS
  RxString selectedGender = "Male".obs;
  void changeGender(String value) => selectedGender.value = value;

  RxString maritalStatus = "Unmarried".obs;
  void changeMaritalStatus(String value) => maritalStatus.value = value;

  RxString selectedBloodGroup = "".obs;

  List<String> bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
  void changeBloodGroup(String value) => selectedBloodGroup.value = value;

  /// 🔍 SEARCH
  TextEditingController searchController = TextEditingController();

  /// 🔥 PATIENT LIST (ISAR)
  RxList<PatientModel> patientList = <PatientModel>[].obs;
  RxList<PatientModel> filteredList = <PatientModel>[].obs;
  RxString searchQuery = ''.obs;

  /// 🔥 LOAD PATIENTS
  Future<void> loadPatients() async {
    final user = await DBService.getUser();
    if (user == null) return;

    final data = await DBService.getPatients(user.firebaseUid);

    patientList.assignAll(data);
    filteredList.assignAll(data); // 🔥 IMPORTANT
  }

  @override
  void onInit() {
    super.onInit();
    loadPatients();

    debounce(searchQuery, (_) {
      filterPatients();
    }, time: const Duration(milliseconds: 300));
  }

  void filterPatients() {
    final query = searchController.text.toLowerCase();

    if (query.isEmpty) {
      filteredList.assignAll(patientList);
    } else {
      filteredList.assignAll(
        patientList.where((p) =>
            p.name.toLowerCase().contains(query) ||
            p.mobile.contains(query) ||
            p.village.toLowerCase().contains(query)),
      );
    }
  }

  Future<void> deletePatient(int index) async {
    if (index < 0 || index >= filteredList.length) {
      Get.snackbar("Error", "Invalid index");
      return;
    }

    final patient = filteredList[index];

    await DBService.deletePatient(patient.id);

    Get.snackbar("Success", "Patient Deleted");

    await loadPatients(); // 🔥 wait for refresh
  }

  /// 🔥 SAVE PATIENT
  Future<void> savePatient() async {
    final user = await DBService.getUser();

    if (user == null) {
      Get.snackbar("Error", "User not found");
      return;
    }

    final patient = PatientModel()
      ..userId = user.firebaseUid
      ..name = nameController.text
      ..mobile = mobileController.text
      ..gender = selectedGender.value
      ..dob = dobController.text
      ..age = ageController.text
      ..bloodGroup = selectedBloodGroup.value
      ..maritalStatus = maritalStatus.value
      ..address = addressController.text
      ..village = villageController.text
      ..weight = weightController.text
      ..height = hightController.text
      ..bpCount = bpcountController.text
      ..sugarLevel = sugerlavelController.text;

    await DBService.savePatient(patient);

    Get.snackbar("Success", "Patient Saved");

    clearForm();

    /// 🔥 FIRST GO BACK
    Get.back();

    /// 🔥 THEN LOAD DATA (AFTER NAVIGATION)
    loadPatients();
  }

  /// 🔥 SET DATA FOR EDIT
  void setPatientData(PatientModel patient, int index) {
    isEditMode.value = true;
    editIndex = index;

    nameController.text = patient.name;
    mobileController.text = patient.mobile;
    dobController.text = patient.dob;
    ageController.text = patient.age;
    addressController.text = patient.address;
    villageController.text = patient.village;
    weightController.text = patient.weight;
    hightController.text = patient.height;
    bpcountController.text = patient.bpCount;
    sugerlavelController.text = patient.sugarLevel;

    selectedGender.value = patient.gender;
    selectedBloodGroup.value = patient.bloodGroup;
    maritalStatus.value = patient.maritalStatus;
  }

  /// 🔥 CLEAR FORM
  void clearForm() {
    nameController.clear();
    mobileController.clear();
    dobController.clear();
    ageController.clear();
    addressController.clear();
    villageController.clear();
    weightController.clear();
    hightController.clear();
    bpcountController.clear();
    sugerlavelController.clear();

    selectedGender.value = "Male";
    selectedBloodGroup.value = "";
    maritalStatus.value = "Unmarried";

    isEditMode.value = false;
    editIndex = null;
  }

  /// ================= PDF + IMAGE =================

  final ImagePicker _picker = ImagePicker();
  RxList<File> pdfList = <File>[].obs;

  Future<void> pickMultipleImages() async {
    final images = await _picker.pickMultiImage();
    if (images.isEmpty) return;

    await createPdfFromImages(images.map((e) => File(e.path)).toList());
  }

  Future<void> createPdfFromImages(List<File> images) async {
    final pdf = pw.Document();

    for (var img in images) {
      final image = pw.MemoryImage(img.readAsBytesSync());
      pdf.addPage(pw.Page(build: (_) => pw.Image(image)));
    }

    final dir = await getApplicationDocumentsDirectory();

    final file = File(
        "${dir.path}/patient_${DateTime.now().millisecondsSinceEpoch}.pdf");

    await file.writeAsBytes(await pdf.save());

    pdfList.add(file);

    Get.snackbar("Success", "PDF Created");
  }

  Future<void> pickMultiplePdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      pdfList.addAll(result.files.map((e) => File(e.path!)));
      Get.snackbar("Success", "PDFs Uploaded");
    }
  }

  void removePdf(int index) => pdfList.removeAt(index);

  Future<void> openPdf(File file) async {
    final result = await OpenFile.open(file.path);

    if (result.type != ResultType.done) {
      Get.snackbar("Error", "No app found to open PDF");
    }
  }
}

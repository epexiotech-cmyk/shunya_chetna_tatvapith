import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import '../../models/patient_model.dart';
import '../../models/visit_model.dart';
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
  String userId = "";

  RxList<String> diseaselist = <String>[].obs;
  RxString selectedDisease = "".obs;

  Future<void> loadDiseases() async {
    final user = await DBService.getUser();
    if (user == null) return;

    final data = await DBService.getDiseases(user.firebaseUid);

    /// 🔥 MODEL → STRING
    diseaselist.assignAll(
      data.map((e) => e.name).toList(),
    );
  }

  /// 🔥 LOAD PATIENTS
  Future<void> loadPatients() async {
    if (userId.isEmpty) {
      return; // 🔥 NO SNACKBAR
    }

    final data = await DBService.getPatients(userId);

    patientList.assignAll(data);
    filterPatients(); // 🔥 always sync filter
  }

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration.zero, () {
      initUser();
      loadDiseases(); // ✅ ONLY THIS
    });

    debounce(searchQuery, (_) {
      filterPatients();
    }, time: const Duration(milliseconds: 300));
  }

  Future<void> initUser() async {
    final user = await DBService.getUser();

    if (user != null) {
      userId = user.firebaseUid;
      await loadPatients();
    } else {
      return; // 🔥 NO UI IN CONTROLLER
    }
  }

  void setUser(String id) {
    userId = id;
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

  Future<void> deletePatient(PatientModel patient) async {
    await DBService.deletePatient(patient.id);

    await loadPatients();

    Get.snackbar("Success", "Patient Deleted");
  }

  /// 🔥 SAVE PATIENT
  Future<void> savePatient() async {
    if (userId.isEmpty) {
      Get.snackbar("Error", "User not found");
      return;
    }

    final patient = PatientModel()
      ..userId = userId
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

    await loadPatients();
    Get.dialog(
      Center(
        child: Lottie.asset(
          'assets/animations/stethoscope.json',
          width: 120,
          height: 120,
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.2),
      barrierDismissible: false,
    );

    /// 🔥 WAIT (LOADING TIME)
    await Future.delayed(const Duration(milliseconds: 2000));
    clearForm();

    /// 🔥 YOUR ORIGINAL FUNCTION
    Get.back(closeOverlays: true);

    /// 🔥 CLOSE LOADER
    Get.back();
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

  RxList<dynamic> diseaseList = [].obs;

  void addDisease(String name) {
    selectedDisease.value = name;
  }

  /// ahi add kar je functionality
  RxList<dynamic> medicineList = [].obs;
  RxList<VisitModel> visitList = <VisitModel>[].obs;

  Future<VisitModel> addVisit(PatientModel patient) async {
    final now = DateTime.now();

    /// 🔥 FIXED MEDICINE JSON (PRICE ADD)
    final medicinesData = medicineList.map((e) {
      return {
        "name": e["name"],
        "qty": e["qty"].toString(),

        /// 🔥 MAIN FIX
        "price": e["price"].toString(),
      };
    }).toList();

    final visit = VisitModel()
      ..patientId = patient.id
      ..date = "${now.day}/${now.month}/${now.year}"
      ..problem = patientproblemController.text
      ..observation = patientobservationlavelController.text
      ..medicinesJson = jsonEncode(medicinesData) // 🔥 UPDATED
      ..pdfPaths = pdfList.map((e) => e.path).toList()
      ..disease = selectedDisease.value.isEmpty ? null : selectedDisease.value;

    await DBService.saveVisit(visit);

    Get.snackbar("Success", "Visit Added");

    /// reload visits
    await loadVisits(patient.id);

    /// ⚠️ CLEAR AFTER SAVE
    patientproblemController.clear();
    patientobservationlavelController.clear();
    pdfList.clear();
    print("medicinesData  :: $medicinesData");

    return visit;
  }

  Future<void> loadVisits(int patientId) async {
    final data = await DBService.getVisits(patientId);
    visitList.assignAll(data);
  }
}

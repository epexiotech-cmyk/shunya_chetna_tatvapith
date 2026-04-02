import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

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
  TextEditingController villageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController hightController = TextEditingController();
  TextEditingController bpcountController = TextEditingController();
  TextEditingController sugerlavelController = TextEditingController();
  TextEditingController patientobservationlavelController =
      TextEditingController();
  TextEditingController patientproblemController = TextEditingController();
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
    {
      "name": "Ramesh Patel",
      "mobile": "9876543210",
      "gender": "Male",
      "dob": "12-03-1990",
      "age": "35",
      "bloodGroup": "O+",
      "maritalStatus": "Married",
      "village": "Atladra",
      "address": "Shiv Residency, Atladra Road, Vadodara - 390012",
      "weight": "72",
      "height": "170",
      "bpCount": "120/80",
      "sugarLevel": "95",
    },
    {
      "name": "Suresh Shah",
      "mobile": "9825147852",
      "gender": "Male",
      "dob": "21-07-1988",
      "age": "37",
      "bloodGroup": "A+",
      "maritalStatus": "Married",
      "village": "Manjalpur",
      "address": "Gokul Nagar Society, Manjalpur Main Road, Vadodara - 390011",
      "weight": "75",
      "height": "172",
      "bpCount": "130/85",
      "sugarLevel": "102",
    },
    {
      "name": "Mahesh Joshi",
      "mobile": "9874563210",
      "gender": "Male",
      "dob": "10-11-1992",
      "age": "32",
      "bloodGroup": "B+",
      "maritalStatus": "Unmarried",
      "village": "Katargam",
      "address": "Green Park Apartment, Katargam Road, Surat - 395004",
      "weight": "70",
      "height": "168",
      "bpCount": "118/78",
      "sugarLevel": "90",
    },
    {
      "name": "Ketan Desai",
      "mobile": "9898765432",
      "gender": "Male",
      "dob": "14-05-1985",
      "age": "40",
      "bloodGroup": "AB+",
      "maritalStatus": "Married",
      "village": "Mavdi",
      "address": "Om Residency, Mavdi Main Road, Rajkot - 360004",
      "weight": "78",
      "height": "175",
      "bpCount": "125/82",
      "sugarLevel": "110",
    },
    {
      "name": "Amit Mehta",
      "mobile": "9812345678",
      "gender": "Male",
      "dob": "02-02-1994",
      "age": "31",
      "bloodGroup": "O-",
      "maritalStatus": "Unmarried",
      "village": "Subhanpura",
      "address": "Shanti Nagar, Subhanpura Road, Vadodara - 390023",
      "weight": "74",
      "height": "171",
      "bpCount": "119/80",
      "sugarLevel": "88",
    },
    {
      "name": "Dharmesh Shah",
      "mobile": "9901234567",
      "gender": "Male",
      "dob": "18-08-1991",
      "age": "33",
      "bloodGroup": "A-",
      "maritalStatus": "Married",
      "village": "Vidhyanagar",
      "address": "College Road Society, Vidhyanagar - 388120",
      "weight": "73",
      "height": "169",
      "bpCount": "122/81",
      "sugarLevel": "100",
    },
    {
      "name": "Nilesh Parmar",
      "mobile": "9871204563",
      "gender": "Male",
      "dob": "11-01-1987",
      "age": "38",
      "bloodGroup": "B+",
      "maritalStatus": "Married",
      "village": "Nadiad",
      "address": "Swaminarayan Street, Nadiad - 387001",
      "weight": "80",
      "height": "176",
      "bpCount": "135/90",
      "sugarLevel": "120",
    },
    {
      "name": "Hardik Patel",
      "mobile": "9898123456",
      "gender": "Male",
      "dob": "09-06-1995",
      "age": "30",
      "bloodGroup": "O-",
      "maritalStatus": "Unmarried",
      "village": "Wadhwan",
      "address": "Station Road Area, Surendranagar - 363030",
      "weight": "68",
      "height": "167",
      "bpCount": "117/76",
      "sugarLevel": "89",
    },
    {
      "name": "Jignesh Shah",
      "mobile": "9811123456",
      "gender": "Male",
      "dob": "19-09-1989",
      "age": "36",
      "bloodGroup": "A+",
      "maritalStatus": "Married",
      "village": "Sector 21",
      "address": "Sector 21 Residential Area, Gandhinagar - 382021",
      "weight": "76",
      "height": "173",
      "bpCount": "126/84",
      "sugarLevel": "105",
    },
    {
      "name": "Rajesh Trivedi",
      "mobile": "9874567890",
      "gender": "Male",
      "dob": "28-04-1983",
      "age": "42",
      "bloodGroup": "AB-",
      "maritalStatus": "Married",
      "village": "Palanpur",
      "address": "Ambaji Highway Area, Palanpur - 385001",
      "weight": "82",
      "height": "178",
      "bpCount": "138/92",
      "sugarLevel": "130",
    },
    {
      "name": "Bhavesh Patel",
      "mobile": "9898989898",
      "gender": "Male",
      "dob": "15-12-1993",
      "age": "31",
      "bloodGroup": "B+",
      "maritalStatus": "Unmarried",
      "village": "Mehsana",
      "address": "Highway Road Area, Mehsana - 384001",
      "weight": "71",
      "height": "169",
      "bpCount": "121/80",
      "sugarLevel": "94",
    },
    {
      "name": "Hitesh Shah",
      "mobile": "9876547890",
      "gender": "Male",
      "dob": "05-03-1986",
      "age": "39",
      "bloodGroup": "O+",
      "maritalStatus": "Married",
      "village": "Junagadh",
      "address": "Girnar Road Area, Junagadh - 362001",
      "weight": "79",
      "height": "174",
      "bpCount": "129/86",
      "sugarLevel": "108",
    },
    {
      "name": "Vikas Patel",
      "mobile": "9822233344",
      "gender": "Male",
      "dob": "07-07-1992",
      "age": "32",
      "bloodGroup": "A+",
      "maritalStatus": "Unmarried",
      "village": "Amreli",
      "address": "Station Road Area, Amreli - 365601",
      "weight": "73",
      "height": "170",
      "bpCount": "118/79",
      "sugarLevel": "91",
    },
    {
      "name": "Parth Mehta",
      "mobile": "9811198765",
      "gender": "Male",
      "dob": "25-10-1996",
      "age": "28",
      "bloodGroup": "AB+",
      "maritalStatus": "Unmarried",
      "village": "Botad",
      "address": "Main Market Area, Botad - 364710",
      "weight": "69",
      "height": "168",
      "bpCount": "116/75",
      "sugarLevel": "85",
    },
    {
      "name": "Rohit Shah",
      "mobile": "9898111122",
      "gender": "Male",
      "dob": "30-01-1984",
      "age": "41",
      "bloodGroup": "B-",
      "maritalStatus": "Married",
      "village": "Morbi",
      "address": "Ceramic Area, Morbi - 363641",
      "weight": "81",
      "height": "177",
      "bpCount": "140/95",
      "sugarLevel": "140",
    },
    {
      "name": "Manish Patel",
      "mobile": "9873216540",
      "gender": "Male",
      "dob": "18-06-1991",
      "age": "33",
      "bloodGroup": "O+",
      "maritalStatus": "Married",
      "village": "Porbandar",
      "address": "Coastal Area Road, Porbandar - 360575",
      "weight": "74",
      "height": "172",
      "bpCount": "124/82",
      "sugarLevel": "98",
    },
    {
      "name": "Alpesh Desai",
      "mobile": "9812340098",
      "gender": "Male",
      "dob": "11-02-1987",
      "age": "38",
      "bloodGroup": "A+",
      "maritalStatus": "Married",
      "village": "Valsad",
      "address": "Tithal Road Area, Valsad - 396001",
      "weight": "76",
      "height": "173",
      "bpCount": "128/85",
      "sugarLevel": "103",
    },
    {
      "name": "Yogesh Shah",
      "mobile": "9898001122",
      "gender": "Male",
      "dob": "09-09-1990",
      "age": "34",
      "bloodGroup": "B+",
      "maritalStatus": "Unmarried",
      "village": "Navsari",
      "address": "Station Road Area, Navsari - 396445",
      "weight": "70",
      "height": "169",
      "bpCount": "119/78",
      "sugarLevel": "92",
    },
    {
      "name": "Tushar Patel",
      "mobile": "9870001234",
      "gender": "Male",
      "dob": "03-04-1988",
      "age": "36",
      "bloodGroup": "O+",
      "maritalStatus": "Married",
      "village": "Bharuch",
      "address": "Zadeshwar Road Area, Bharuch - 392001",
      "weight": "77",
      "height": "175",
      "bpCount": "127/83",
      "sugarLevel": "104",
    },
    {
      "name": "Chirag Mehta",
      "mobile": "9812345670",
      "gender": "Male",
      "dob": "22-08-1993",
      "age": "31",
      "bloodGroup": "AB+",
      "maritalStatus": "Unmarried",
      "village": "Dahod",
      "address": "Railway Colony Area, Dahod - 389151",
      "weight": "72",
      "height": "171",
      "bpCount": "120/79",
      "sugarLevel": "96",
    },
  ].obs;

  final ImagePicker _picker = ImagePicker();

  RxList<File> selectedImages = <File>[].obs;
  Rx<File?> generatedPdf = Rx<File?>(null);

  /// 📸 MULTIPLE IMAGE PICK + AUTO PDF
  // RxList<File> pdfList = <File>[].obs;

  /// 📸 MULTI IMAGE → DIRECT PDF
  Future<void> pickMultipleImages() async {
    final List<XFile> images = await _picker.pickMultiImage();

    if (images.isEmpty) return;

    await createPdfFromImages(images.map((e) => File(e.path)).toList());
  }

  /// 🧾 CREATE PDF (BATCH WISE)
  Future<void> createPdfFromImages(List<File> images) async {
    final pdf = pw.Document();

    for (var img in images) {
      final image = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(
        pw.Page(
          build: (context) {
            return pw.Center(child: pw.Image(image));
          },
        ),
      );
    }

    final dir = await getApplicationDocumentsDirectory();

    final file = File(
      "${dir.path}/patient_${DateTime.now().millisecondsSinceEpoch}.pdf",
    );

    await file.writeAsBytes(await pdf.save());

    /// ✅ ADD NEW PDF TO LIST
    pdfList.add(file);

    Get.snackbar("Success", "PDF Created");
  }

  /// 📄 PICK ONLY PDF
  RxList<File> pdfList = <File>[].obs;

  /// 📄 MULTIPLE PDF PICK
  Future<void> pickMultiplePdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      pdfList.addAll(result.files.map((e) => File(e.path!)).toList());

      Get.snackbar("Success", "PDFs Uploaded");
    }
  }

  void removePdf(int index) {
    pdfList.removeAt(index);
  }

  /// 📄 OPEN PDF IN EXTERNAL APP
  Future<void> openPdf(File file) async {
    final result = await OpenFile.open(file.path);

    if (result.type != ResultType.done) {
      Get.snackbar("Error", "No app found to open PDF");
    }
  }
}

import 'package:get/get.dart';

class SelectMedicineController extends GetxController {
  /// Medicine table list
  RxList<dynamic> medicineList = [].obs;

  /// Use dropdown options
  List<String> useList = ["1-1", "1-1-1", "1(M)", "1(N)"];

  /// Add medicine
  void addMedicine(String name) {
    medicineList.add({"name": name, "qty": 1, "use": "1-1", "price": ""});

    update();
  }

  /// Update use
  void updateUse(int index, String value) {
    medicineList[index]["use"] = value;
    update();
  }

  /// Update price
  void updatePrice(int index, String value) {
    medicineList[index]["price"] = value;
    update();
  }

  /// Remove medicine
  void removeMedicine(int index) {
    medicineList.removeAt(index);
    update();
  }

  /// Increase quantity
  void increaseQty(int index) {
    medicineList[index]["qty"]++;
    update();
  }

  /// Decrease quantity
  void decreaseQty(int index) {
    if (medicineList[index]["qty"] > 1) {
      medicineList[index]["qty"]--;
      update();
    }
  }

  /// Dropdown data

  List<String> arclist = [
    "GM Mix",
    "AJMVR",
    "M-1",
    "M-2",
    "ASHOK",
    "D",
    "KRT",
    "SUAGUL",
  ];

  List<String> tabletlist = ["A+", "A-", "B+", "B-"];

  List<String> oillist = ["MLD Oil", "Hair Oil", "SPL Hair Oil"];

  List<String> droplist = ["SPL Drop", "EYE Drop", "EAR Drop"];

  List<String> nasyalist = ["SPL Nashya", "Nashya", "ROLON"];

  List<String> powerlist = ["TDS", "RSV", "GODANTI", "BHASAM"];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController
    with GetTickerProviderStateMixin {
  // Add Inventory

  RxList<InventoryItem> inventoryList = <InventoryItem>[].obs;
  bool isedit = false;
  RxBool isEditMode = false.obs;
  int? editIndex;

  @override
  void onInit() {
    super.onInit();
    addRow();
  }

  void addRow() {
    inventoryList.add(InventoryItem());
  }

  void removeRow(int index) {
    inventoryList.removeAt(index);
  }

  RxList<dynamic> medicineList = [].obs;

  List<String> typelist = ["ARK", "OIL", "Nasya", "Power", "Tablet", "Drop"];

  List<String> uselist = [
    "1-1",
    "2 in mon",
    "2 in night",
  ];
  List<String> useoillist = [
    "1-1-1",
    "1-1",
    "Hit",
    "Non-Hit",
  ];
  List<String> useNasaylist = [
    "1-1",
    "1-1-1",
  ];
  List<String> usepowerlist = [
    "1-1(Eat)",
    "1 (Eat)",
    "(Eat) 1",
    "Brush",
    "Past",
  ];

  List<String> useTabletlist = [
    "1-1-1",
    "1-1",
    "1 (M)",
    "(N) 1",
  ];

  List<String> useDroplist = [
    "20-20-20",
    "10-10-10",
    "1-1 (I)",
    "1-1 (E)",
  ];

  /// Add medicine
  void addMedicine(String name) {
    medicineList.add({"name": name, "qty": 1, "use": "1-1", "price": ""});

    update();
  }

  // Inventory index

  TextEditingController searchController = TextEditingController();
  TextEditingController medicinenameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  RxList<Map<String, dynamic>> stockList = [
    {"name": "Paracetamol", "qty": 120, "price": 10},
    {"name": "Amoxicillin", "qty": 50, "price": 20},
    {"name": "Crocin", "qty": 8, "price": 15},
    {"name": "Dolo 650", "qty": 30, "price": 12},
    {"name": "Azithromycin", "qty": 45, "price": 25},
    {"name": "Ibuprofen", "qty": 60, "price": 18},
    {"name": "Cetrizine", "qty": 75, "price": 8},
    {"name": "Pantoprazole", "qty": 40, "price": 22},
    {"name": "Metformin", "qty": 90, "price": 14},
    {"name": "Atorvastatin", "qty": 35, "price": 30},
    {"name": "Losartan", "qty": 20, "price": 28},
    {"name": "Montelukast", "qty": 25, "price": 16},
    {"name": "Omeprazole", "qty": 70, "price": 19},
    {"name": "Diclofenac", "qty": 15, "price": 13},
    {"name": "Levocetirizine", "qty": 55, "price": 11},
    {"name": "Ranitidine", "qty": 10, "price": 9},
    {"name": "Aspirin", "qty": 80, "price": 6},
    {"name": "Clopidogrel", "qty": 18, "price": 32},
    {"name": "Vitamin D3", "qty": 65, "price": 20},
    {"name": "Calcium Tablet", "qty": 100, "price": 17},
  ].obs;
  RxString searchText = "".obs;

  List<Map<String, dynamic>> get filteredStock {
    if (searchText.value.isEmpty) {
      return stockList;
    }

    return stockList
        .where(
          (item) => item["name"].toLowerCase().contains(
                searchText.value.toLowerCase(),
              ),
        )
        .toList();
  }

  void saveOrUpdateInventory() {
    final data = {
      "name": medicinenameController.text,
      "qty": int.tryParse(quantityController.text) ?? 0,
      "price": int.tryParse(priceController.text) ?? 0,
    };

    if (isEditMode.value && editIndex != null) {
      stockList[editIndex!] = data; // 🔄 UPDATE
    } else {
      stockList.add(data); // ➕ ADD
    }

    clearForm();

    Get.back(result: true);
  }

  void clearForm() {
    medicinenameController.clear();
    quantityController.clear();
    priceController.clear();

    isEditMode.value = false;
    editIndex = null;
  }

  void setEditData(Map<String, dynamic> data, int index) {
    isEditMode.value = true;
    editIndex = index;

    medicinenameController.text = data["name"];
    quantityController.text = data["qty"].toString();
    priceController.text = data["price"].toString();
  }
}

class InventoryItem {
  TextEditingController name = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController price = TextEditingController();

  RxString type = "ARK".obs;
  RxString use = "1-1".obs;
}

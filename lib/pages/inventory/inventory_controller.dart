import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController
    with GetTickerProviderStateMixin {
  // Add Inventory

  RxList<Map<String, TextEditingController>> inventoryList =
      <Map<String, TextEditingController>>[].obs;

  @override
  void onInit() {
    super.onInit();
    addRow();
  }

  void addRow() {
    inventoryList.add({
      "name": TextEditingController(),
      "qty": TextEditingController(),
      "price": TextEditingController(),
    });
  }

  void removeRow(int index) {
    inventoryList.removeAt(index);
  }

  // Inventory index

  TextEditingController searchController = TextEditingController();

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
}

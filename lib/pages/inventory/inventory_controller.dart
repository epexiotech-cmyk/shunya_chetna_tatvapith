import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/models/inventory_model.dart';
import 'package:shunya_app/models/inventory_stock_model.dart';
import 'package:shunya_app/services/db_service.dart';

class InventoryController extends GetxController {
  RxList<InventoryItem> inventoryList = <InventoryItem>[].obs;

  RxList stockList = [].obs;
  TextEditingController searchController = TextEditingController();
  RxString searchText = "".obs;
  RxBool isEditMode = false.obs; // 🔥 REQUIRED
  int? editIndex; // 🔥 REQUIRED

  @override
  void onInit() {
    super.onInit();
    loadInventory(); // 🔥 MUST

    /// 🔥 ONLY ADD DEFAULT IF NOT EDIT MODE
    if (!isEditMode.value && inventoryList.isEmpty) {
      addRow();
    }
  }

  void resetForm() {
    isEditMode.value = false;
    editIndex = null;
    inventoryList.clear();

    /// 🔥 add fresh empty row
    addRow();
  }

  void addRow() {
    inventoryList.add(InventoryItem());
  }

  /// 🔍 FILTER
  List get filteredStock {
    if (searchText.value.isEmpty) return stockList;

    return stockList.where((item) {
      return item["name"]
          .toString()
          .toLowerCase()
          .contains(searchText.value.toLowerCase());
    }).toList();
  }

  /// 🔥 SAVE INVENTORY
  Future<void> saveOrUpdateInventory() async {
    final user = await DBService.getUser();
    final clinicId = await DBService.getSelectedClinicId();

    if (user == null || clinicId == null) {
      Get.snackbar("Error", "User/Clinic not found");
      return;
    }

    final item = inventoryList.first;

    /// 🔥 CHECK EXISTING MASTER
    final existing = await DBService.getInventoryByName(
      item.name.text,
      user.firebaseUid,
    );

    int inventoryId;

    if (existing != null) {
      inventoryId = existing.id;
    } else {
      final newItem = InventoryModel()
        ..userId = user.firebaseUid
        ..name = item.name.text
        ..type = item.type.value
        ..use = item.use.value;

      inventoryId = await DBService.saveInventory(newItem);
    }

    /// 🔥 CHECK STOCK
    final existingStock = await DBService.getStockByClinicAndInventory(
      clinicId,
      inventoryId,
    );

    if (existingStock != null) {
      await DBService.updateStock(
        existingStock.id,
        int.tryParse(item.qty.text) ?? 0,
        int.tryParse(item.price.text) ?? 0,
      );
    } else {
      final stock = InventoryStockModel()
        ..userId = user.firebaseUid
        ..clinicId = clinicId
        ..inventoryId = inventoryId
        ..qty = int.tryParse(item.qty.text) ?? 0
        ..price = int.tryParse(item.price.text) ?? 0;

      await DBService.saveInventoryStock(stock);
    }

    // Get.snackbar("Success", "Inventory Saved");

    /// 🔥 VERY IMPORTANT
    // 🔥 FORCE REFRESH
    Get.snackbar(
      "Success",
      "Inventory Saved",
      duration: const Duration(milliseconds: 500),
    );
    loadInventory();
    resetForm();
    Get.back(closeOverlays: true);
  }

  /// 🔥 LOAD INVENTORY
  Future<void> loadInventory() async {
    final user = await DBService.getUser();
    final clinicId = await DBService.getSelectedClinicId();

    if (user == null || clinicId == null) {
      return;
    }

    final data = await DBService.getInventoryWithStock(
      user.firebaseUid,
      clinicId,
    );

    stockList.assignAll(data);
  }

  void setEditData(Map<String, dynamic> data, int index) {
    isEditMode.value = true;
    editIndex = index;

    inventoryList.clear();

    final item = InventoryItem();

    item.name.text = data["name"] ?? "";
    item.qty.text = data["qty"].toString();
    item.price.text = data["price"].toString();

    item.type.value = data["type"] ?? "ARK";
    item.use.value = data["use"] ?? "1-1";

    inventoryList.add(item);
  }

  /// 🔥 TYPE LIST
  List<String> typelist = ["ARK", "OIL", "Nasya", "Power", "Tablet", "Drop"];

  /// 🔥 USE LISTS
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

  List<String> getUseList(String type) {
    switch (type) {
      case "ARK":
        return uselist;
      case "OIL":
        return useoillist;
      case "Nasya":
        return useNasaylist;
      case "Power":
        return usepowerlist;
      case "Tablet":
        return useTabletlist;
      case "Drop":
        return useDroplist;
      default:
        return [];
    }
  }

  Future<void> deleteInventory(int inventoryId) async {
    final clinicId = await DBService.getSelectedClinicId();

    if (clinicId == null) return;

    /// 🔥 DELETE STOCK (only this clinic)
    final stock = await DBService.getStockByClinicAndInventory(
      clinicId,
      inventoryId,
    );

    if (stock != null) {
      await DBService.deleteStock(stock.id);
    }

    /// 🔥 OPTIONAL: DELETE MASTER IF NOT USED ANYWHERE
    final isUsed = await DBService.checkInventoryUsedAnywhere(inventoryId);

    if (!isUsed) {
      await DBService.deleteInventory(inventoryId);
    }

    /// 🔥 REFRESH LIST
    await loadInventory();

    Get.snackbar("Deleted", "Inventory removed");
  }
}

class InventoryItem {
  TextEditingController name = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController price = TextEditingController();

  RxString type = "ARK".obs;
  RxString use = "1-1".obs;
}

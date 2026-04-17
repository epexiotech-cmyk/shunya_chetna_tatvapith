import 'package:get/get.dart';
import 'package:shunya_app/services/db_service.dart';

class SelectMedicineController extends GetxController {
  /// 🔥 Medicine table list
  RxList<dynamic> medicineList = [].obs;
  late bool isEditMode;

  /// 🔥 Use dropdown options (optional)
  List<String> useList = ["1-1", "1-1-1", "1(M)", "1(N)"];

  /// 🔥 Dynamic inventory lists
  RxList<String> arclist = <String>[].obs;
  RxList<String> tabletlist = <String>[].obs;
  RxList<String> oillist = <String>[].obs;
  RxList<String> droplist = <String>[].obs;
  RxList<String> nasyalist = <String>[].obs;
  RxList<String> powerlist = <String>[].obs;

  /// 🔥 MAPS (IMPORTANT)
  Map<String, int> priceMap = {};
  Map<String, String> useMap = {};

  @override
  void onInit() {
    super.onInit();
    loadMedicinesFromInventory();
  }

  /// 🔥 LOAD INVENTORY DATA
  Future<void> loadMedicinesFromInventory() async {
    final user = await DBService.getUser();
    final clinicId = await DBService.getSelectedClinicId();

    if (user == null || clinicId == null) return;

    final data = await DBService.getInventoryWithStock(
      user.firebaseUid,
      clinicId,
    );

    /// clear all
    arclist.clear();
    tabletlist.clear();
    oillist.clear();
    droplist.clear();
    nasyalist.clear();
    powerlist.clear();
    priceMap.clear();
    useMap.clear(); // 🔥 important

    for (var item in data) {
      String name = item["name"] ?? "";
      String type = item["type"] ?? "";
      int price = item["price"] ?? 0;
      String use = item["use"] ?? "1-1";

      /// 🔥 store maps
      priceMap[name] = price;
      useMap[name] = use;

      /// 🔥 assign category
      switch (type) {
        case "ARK":
          if (!arclist.contains(name)) arclist.add(name);
          break;
        case "Tablet":
          if (!tabletlist.contains(name)) tabletlist.add(name);
          break;
        case "OIL":
          if (!oillist.contains(name)) oillist.add(name);
          break;
        case "Drop":
          if (!droplist.contains(name)) droplist.add(name);
          break;
        case "Nasya":
          if (!nasyalist.contains(name)) nasyalist.add(name);
          break;
        case "Power":
          if (!powerlist.contains(name)) powerlist.add(name);
          break;
      }
    }
  }

  /// 🔥 ADD MEDICINE (FINAL FIX)
  void addMedicine(String name) {
    bool exists = medicineList.any((e) => e["name"] == name);

    if (!exists) {
      medicineList.add({
        "name": name,
        "qty": 1,

        /// 🔥 NOW FROM DB
        "use": useMap[name] ?? "1-1",

        /// 🔥 PRICE FROM DB
        "price": (priceMap[name] ?? 0).toString(),
      });

      medicineList.refresh();
    }
  }

  /// 🔥 UPDATE USE
  void updateUse(int index, String value) {
    medicineList[index]["use"] = value;
    medicineList.refresh();
  }

  /// 🔥 UPDATE PRICE
  void updatePrice(int index, String value) {
    medicineList[index]["price"] = value;
    medicineList.refresh();
  }

  /// 🔥 REMOVE
  void removeMedicine(int index) {
    medicineList.removeAt(index);
    medicineList.refresh();
  }

  /// 🔥 QTY +
  void increaseQty(int index) {
    medicineList[index]["qty"]++;
    medicineList.refresh();
  }

  /// 🔥 QTY -
  void decreaseQty(int index) {
    if (medicineList[index]["qty"] > 1) {
      medicineList[index]["qty"]--;
      medicineList.refresh();
    }
  }
}

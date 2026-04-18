import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shunya_app/models/clinic_model.dart';
import 'package:shunya_app/models/disease_model.dart';
import 'package:shunya_app/models/inventory_model.dart';
import 'package:shunya_app/models/inventory_stock_model.dart';
import 'package:shunya_app/models/patient_model.dart';

import '../models/user_model.dart';
import '../models/visit_model.dart';

class DBService {
  static late Isar isar;

  /// 🔹 Initialize Isar DB
  static Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        UserModelSchema,
        ClinicModelSchema,
        PatientModelSchema,
        VisitModelSchema,
        DiseaseModelSchema,
        InventoryModelSchema,
        InventoryStockModelSchema,
      ],
      directory: dir.path,
    );
  }

  /// 🔹 Save or update user in local DB
  static Future<void> saveUser(User firebaseUser) async {
    final existingUser = await isar.userModels
        .filter()
        .firebaseUidEqualTo(firebaseUser.uid)
        .findFirst();

    await isar.writeTxn(() async {
      /// 🔥 STEP 1: ALL USERS → LOGOUT
      final allUsers = await isar.userModels.where().findAll();
      for (var u in allUsers) {
        u.isLoggedIn = false;
        await isar.userModels.put(u);
      }

      /// 🔥 STEP 2: CURRENT USER LOGIN
      if (existingUser == null) {
        final newUser = UserModel()
          ..firebaseUid = firebaseUser.uid
          ..name = firebaseUser.displayName ?? ""
          ..email = firebaseUser.email ?? ""
          ..mobile = ""
          ..pinHash = null
          ..isLoggedIn = true;

        await isar.userModels.put(newUser);
      } else {
        existingUser.name = firebaseUser.displayName ?? "";
        existingUser.email = firebaseUser.email ?? "";
        existingUser.isLoggedIn = true;

        await isar.userModels.put(existingUser);
      }
    });
  }

  /// 🔥 UPDATE USER (DO NOT TOUCH PIN)
  static Future<void> updateUser(User firebaseUser) async {
    final user = await getUser();

    if (user == null) return;

    user.name = firebaseUser.displayName ?? "";
    user.email = firebaseUser.email ?? "";

    await isar.writeTxn(() async {
      await isar.userModels.put(user);
    });
  }

  // static Future<UserModel?> getUser() async {
  //   return await isar.userModels.filter().isLoggedInEqualTo(true).findFirst();
  // }

  static Future<UserModel?> getUser() async {
    final user =
        await isar.userModels.filter().isLoggedInEqualTo(true).findFirst();

    if (user != null) return user;

    /// 🔥 FALLBACK (IMPORTANT)
    return await isar.userModels.where().findFirst();
  }

  /// 🔹 Update PIN (hashed)
  static Future<void> updatePin(String pinHash) async {
    final user = await getUser();

    if (user != null) {
      user.pinHash = pinHash;

      await isar.writeTxn(() async {
        await isar.userModels.put(user);
      });
    }
  }

  /// 🔹 Check if PIN exists
  static Future<bool> hasPin() async {
    final user = await getUser();
    return user?.pinHash != null;
  }

  /// 🔹 Logout (optional)
  static Future<void> logout() async {
    final user = await getUser();

    if (user != null) {
      user.isLoggedIn = false;

      await isar.writeTxn(() async {
        await isar.userModels.put(user);
      });
    }
  }

  /// 🔥 SAVE CLINICS
  static Future<void> saveClinics(List<ClinicModel> clinics) async {
    await isar.writeTxn(() async {
      await isar.clinicModels.clear(); // optional (overwrite)
      await isar.clinicModels.putAll(clinics);
    });
  }

  /// 🔥 GET CLINICS
  static Future<List<ClinicModel>> getClinics() async {
    return await isar.clinicModels.where().findAll();
  }

  /// 🔥 SAVE SELECTED CLINIC
  static Future<void> saveSelectedClinic(ClinicModel clinic) async {
    await isar.writeTxn(() async {
      await isar.clinicModels.put(clinic);
    });
  }

  /// 🔥 SAVE DISEASE
  static Future<void> saveDisease(DiseaseModel disease) async {
    await isar.writeTxn(() async {
      await isar.diseaseModels.put(disease);
    });
  }

  /// 🔥 GET DISEASES (USER-WISE)
  static Future<List<DiseaseModel>> getDiseases(String userId) async {
    return await isar.diseaseModels.filter().userIdEqualTo(userId).findAll();
  }

  /// 🔥 DELETE DISEASE
  static Future<void> deleteDisease(int id) async {
    await isar.writeTxn(() async {
      await isar.diseaseModels.delete(id);
    });
  }

  static Future<int> saveInventory(InventoryModel item) async {
    return await isar.writeTxn(() async {
      return await isar.inventoryModels.put(item);
    });
  }

  static Future<InventoryModel?> getInventoryByName(
      String name, String userId) async {
    return await isar.inventoryModels
        .filter()
        .nameEqualTo(name)
        .userIdEqualTo(userId)
        .findFirst();
  }

  static Future<void> saveInventoryStock(InventoryStockModel stock) async {
    await isar.writeTxn(() async {
      await isar.inventoryStockModels.put(stock);
    });
  }

  static Future<List<Map<String, dynamic>>> getInventoryWithStock(
      String userId, String clinicId) async {
    final inventoryList =
        await isar.inventoryModels.filter().userIdEqualTo(userId).findAll();

    final stockList = await isar.inventoryStockModels
        .filter()
        .clinicIdEqualTo(clinicId)
        .findAll();

    List<Map<String, dynamic>> result = [];

    for (var item in inventoryList) {
      final stock = stockList.firstWhere(
        (s) => s.inventoryId == item.id,
        orElse: () => InventoryStockModel()
          ..qty = 0
          ..price = 0,
      );

      result.add({
        "id": item.id,
        "name": item.name,
        "type": item.type,
        "use": item.use,
        "qty": stock.qty,
        "price": stock.price,
      });
    }

    return result;
  }

  static Future<String?> getSelectedClinicId() async {
    final user = await getUser();
    return user?.selectedClinicId;
  }

  static Future<void> updateSelectedClinic(String clinicId) async {
    final user = await getUser();
    if (user == null) return;

    await isar.writeTxn(() async {
      user.selectedClinicId = clinicId;
      await isar.userModels.put(user);
    });
  }

  static Future<InventoryStockModel?> getStockByClinicAndInventory(
      String clinicId, int inventoryId) async {
    return await isar.inventoryStockModels
        .filter()
        .clinicIdEqualTo(clinicId)
        .and()
        .inventoryIdEqualTo(inventoryId)
        .findFirst();
  }

  static Future<void> updateStock(int id, int qty, int price) async {
    final stock = await isar.inventoryStockModels.get(id);
    if (stock == null) return;

    await isar.writeTxn(() async {
      stock.qty = qty;
      stock.price = price;
      await isar.inventoryStockModels.put(stock);
    });
  }

  static Future<void> deleteStock(int id) async {
    await isar.writeTxn(() async {
      await isar.inventoryStockModels.delete(id);
    });
  }

  static Future<void> deleteInventory(int id) async {
    await isar.writeTxn(() async {
      await isar.inventoryModels.delete(id);
    });
  }

  static Future<bool> checkInventoryUsedAnywhere(int inventoryId) async {
    final data = await isar.inventoryStockModels
        .filter()
        .inventoryIdEqualTo(inventoryId)
        .findAll();

    return data.isNotEmpty;
  }

  /// 💾 SAVE PATIENT
  static Future<void> savePatient(PatientModel patient) async {
    await isar.writeTxn(() async {
      await isar.patientModels.put(patient);
    });
  }

  /// 📥 GET ALL PATIENTS (USER BASED)
  static Future<List<PatientModel>> getPatients(String userId) async {
    return await isar.patientModels
        .filter()
        .userIdEqualTo(userId)
        .sortByCreatedAtDesc()
        .findAll();
  }

  /// ❌ DELETE PATIENT
  static Future<void> deletePatient(int id) async {
    await isar.writeTxn(() async {
      await isar.patientModels.delete(id);
    });
  }

  static Future<void> saveVisit(VisitModel visit) async {
    await isar.writeTxn(() async {
      await isar.visitModels.put(visit);
    });
  }

  static Future<List<VisitModel>> getVisits(int patientId) async {
    return await isar.visitModels
        .filter()
        .patientIdEqualTo(patientId)
        .sortByDateDesc()
        .findAll();
  }
}

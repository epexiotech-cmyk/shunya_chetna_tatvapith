import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shunya_app/models/clinic_model.dart';

import '../models/user_model.dart';

class DBService {
  static late Isar isar;

  /// 🔹 Initialize Isar DB
  static Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [UserModelSchema, ClinicModelSchema],
      directory: dir.path,
    );
  }

  /// 🔹 Save user to local DB
  static Future<void> saveUser(User firebaseUser) async {
    final existingUser = await isar.userModels
        .filter()
        .firebaseUidEqualTo(firebaseUser.uid)
        .findFirst();

    if (existingUser == null) {
      final newUser = UserModel()
        ..firebaseUid = firebaseUser.uid
        ..name = firebaseUser.displayName ?? ""
        ..email = firebaseUser.email ?? ""
        ..isLoggedIn = true;

      await isar.writeTxn(() async {
        await isar.userModels.put(newUser);
      });
    }
  }

  /// 🔹 Get current user
  static Future<UserModel?> getUser() async {
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
}

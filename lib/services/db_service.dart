import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shunya_app/models/clinic_model.dart';
import 'package:shunya_app/models/disease_model.dart';
import 'package:shunya_app/models/patient_model.dart';

import '../models/user_model.dart';

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
        DiseaseModelSchema,
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
      if (existingUser == null) {
        /// 🆕 NEW USER
        final newUser = UserModel()
          ..firebaseUid = firebaseUser.uid
          ..name = firebaseUser.displayName ?? ""
          ..email = firebaseUser.email ?? ""
          ..mobile = ""
          ..pinHash = null
          ..isLoggedIn = true;

        await isar.userModels.put(newUser);
      } else {
        /// 🔄 EXISTING USER → UPDATE ONLY SAFE FIELDS
        existingUser.name = firebaseUser.displayName ?? "";
        existingUser.email = firebaseUser.email ?? "";
        existingUser.isLoggedIn = true;

        /// ❌ DO NOT TOUCH:
        /// existingUser.pinHash
        /// existingUser.mobile

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

  static Future<UserModel?> getUser() async {
    return await isar.userModels.filter().isLoggedInEqualTo(true).findFirst();
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

  /// 🔥 SAVE PATIENT
  /// 🔥 SAVE PATIENT
  static Future<void> savePatient(PatientModel patient) async {
    await isar.writeTxn(() async {
      await isar.patientModels.put(patient);
    });
  }

  /// 🔥 GET PATIENTS
  static Future<List<PatientModel>> getPatients(String userId) async {
    return await isar.patientModels.filter().userIdEqualTo(userId).findAll();
  }

  /// 🔥 UPDATE PATIENT
  static Future<void> updatePatient(PatientModel patient) async {
    await isar.writeTxn(() async {
      await isar.patientModels.put(patient);
    });
  }

  static Future<void> deletePatient(int id) async {
    await isar.writeTxn(() async {
      await isar.patientModels.delete(id);
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
}

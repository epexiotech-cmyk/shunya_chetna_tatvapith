// import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../services/db_service.dart';
// import '../../routes/common/common_app_pages.dart';

// class PinController extends GetxController {
//   /// 🔥 PIN BOXES
//   List<TextEditingController> pinBoxes =
//       List.generate(4, (_) => TextEditingController());

//   List<TextEditingController> confirmBoxes =
//       List.generate(4, (_) => TextEditingController());

//   /// 🔥 OLD PIN (FOR RESET)
//   List<TextEditingController> oldPinBoxes =
//       List.generate(4, (_) => TextEditingController());

//   List<FocusNode> pinFocus = List.generate(4, (_) => FocusNode());
//   List<FocusNode> confirmFocus = List.generate(4, (_) => FocusNode());
//   List<FocusNode> oldPinFocus = List.generate(4, (_) => FocusNode());

//   RxBool isSetMode = false.obs;
//   RxBool isResetMode = false.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     final args = Get.arguments;

//     if (args != null) {
//       isSetMode.value = args["isSet"] ?? false;
//       isResetMode.value = args["isReset"] ?? false;
//     }

//     /// 🔥 FIX: RESET MODE SHOULD OVERRIDE SET MODE
//     if (isResetMode.value) {
//       isSetMode.value = false;
//     }
//     print("isResetMode  :::: $isResetMode");
//   }

//   /// 🔐 HASH PIN
//   String hashPin(String pin) {
//     return sha256.convert(utf8.encode(pin)).toString();
//   }

//   /// 🔥 GET PIN STRINGS
//   String get enteredPin => pinBoxes.map((e) => e.text).join();
//   String get confirmPin => confirmBoxes.map((e) => e.text).join();
//   String get oldPin => oldPinBoxes.map((e) => e.text).join();

//   // =========================================================
//   // 🔥 SET / RESET PIN
//   // =========================================================
//   Future<void> saveOrResetPin() async {
//     try {
//       /// 🔴 VALIDATION
//       if (enteredPin.length != 4 || confirmPin.length != 4) {
//         Get.snackbar("Error", "Enter 4 digit PIN");
//         return;
//       }

//       if (enteredPin != confirmPin) {
//         Get.snackbar("Error", "PIN does not match");
//         return;
//       }

//       final user = await DBService.getUser();

//       if (user == null) {
//         Get.snackbar("Error", "User not found");
//         return;
//       }

//       /// 🔥 RESET MODE → CHECK OLD PIN
//       if (isResetMode.value) {
//         if (oldPin.length != 4) {
//           Get.snackbar("Error", "Enter old PIN");
//           return;
//         }

//         final oldHash = hashPin(oldPin);

//         if (oldHash != user.pinHash) {
//           Get.snackbar("Error", "Old PIN is incorrect");
//           return;
//         }
//       }

//       /// 🔥 SAVE NEW PIN
//       final pinHash = hashPin(enteredPin);
//       await DBService.updatePin(pinHash);

//       Get.snackbar("Success", "PIN Updated Successfully");

//       /// 🔥 NAVIGATION
//       Get.offAllNamed(routeprofilepage);
//     } catch (e) {
//       print("PIN ERROR: $e");
//       Get.snackbar("Error", "Failed to save PIN");
//     }
//   }

//   // =========================================================
//   // 🔥 VERIFY PIN (LOGIN FLOW)
//   // =========================================================
//   Future<void> verifyPin() async {
//     try {
//       if (enteredPin.length != 4) {
//         Get.snackbar("Error", "Enter 4 digit PIN");
//         return;
//       }

//       final user = await DBService.getUser();

//       if (user == null || user.pinHash == null) {
//         Get.snackbar("Error", "PIN not found");
//         return;
//       }

//       final enteredHash = hashPin(enteredPin);

//       if (enteredHash == user.pinHash) {
//         Get.snackbar("Success", "PIN Verified");

//         /// 🔥 NEXT FLOW (YOU WILL UPDATE LATER)
//         Get.offAllNamed(routeprofilepage);
//       } else {
//         Get.snackbar("Error", "Incorrect PIN");
//       }
//     } catch (e) {
//       print("VERIFY ERROR: $e");
//       Get.snackbar("Error", "Verification failed");
//     }
//   }

//   @override
//   void onClose() {
//     for (var c in pinBoxes) {
//       c.dispose();
//     }
//     for (var c in confirmBoxes) {
//       c.dispose();
//     }
//     for (var c in oldPinBoxes) {
//       c.dispose();
//     }
//     for (var f in pinFocus) {
//       f.dispose();
//     }
//     for (var f in confirmFocus) {
//       f.dispose();
//     }
//     for (var f in oldPinFocus) {
//       f.dispose();
//     }
//     super.onClose();
//   }
// }

import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/db_service.dart';
import '../../routes/common/common_app_pages.dart';

class PinController extends GetxController {
  List<TextEditingController> pinBoxes =
      List.generate(4, (_) => TextEditingController());

  List<TextEditingController> confirmBoxes =
      List.generate(4, (_) => TextEditingController());

  List<TextEditingController> oldPinBoxes =
      List.generate(4, (_) => TextEditingController());

  List<FocusNode> pinFocus = List.generate(4, (_) => FocusNode());
  List<FocusNode> confirmFocus = List.generate(4, (_) => FocusNode());
  List<FocusNode> oldPinFocus = List.generate(4, (_) => FocusNode());

  RxBool isSetMode = false.obs;
  RxBool isResetMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    if (args != null) {
      isSetMode.value = args["isSet"] ?? false;
      isResetMode.value = args["isReset"] ?? false;
    }

    /// 🔥 FIX: Reset overrides set
    if (isResetMode.value) {
      isSetMode.value = false;
    }
  }

  String hashPin(String pin) {
    return sha256.convert(utf8.encode(pin)).toString();
  }

  String get enteredPin => pinBoxes.map((e) => e.text).join();
  String get confirmPin => confirmBoxes.map((e) => e.text).join();
  String get oldPin => oldPinBoxes.map((e) => e.text).join();

  /// 🔥 SET / RESET PIN
  Future<void> saveOrResetPin() async {
    if (enteredPin.length != 4 || confirmPin.length != 4) {
      Get.snackbar("Error", "Enter 4 digit PIN");
      return;
    }

    if (enteredPin != confirmPin) {
      Get.snackbar("Error", "PIN does not match");
      return;
    }

    try {
      final user = await DBService.getUser();

      if (user == null) {
        Get.snackbar("Error", "User not found");
        return;
      }

      /// 🔥 RESET MODE (SAFE HANDLING)
      if (isResetMode.value) {
        if (oldPin.length != 4) {
          Get.snackbar("Error", "Enter old PIN");
          return;
        }

        /// Only check if old PIN exists
        if (user.pinHash != null) {
          final oldHash = hashPin(oldPin);

          if (oldHash != user.pinHash) {
            Get.snackbar("Error", "Old PIN is incorrect");
            return;
          }
        }
      }

      final pinHash = hashPin(enteredPin);

      await DBService.updatePin(pinHash);

      Get.snackbar("Success", "PIN Updated Successfully");

      Get.offAllNamed(routeprofilepage);
    } catch (e) {
      Get.snackbar("Error", "Failed to save PIN");
    }
  }

  Future<void> verifyPin() async {
    if (enteredPin.length != 4) {
      Get.snackbar("Error", "Enter 4 digit PIN");
      return;
    }

    try {
      final user = await DBService.getUser();

      if (user == null || user.pinHash == null) {
        Get.snackbar("Error", "PIN not found");
        return;
      }

      final enteredHash = hashPin(enteredPin);

      if (enteredHash == user.pinHash) {
        Get.snackbar("Success", "PIN Verified");

        /// 🔥 GET CLINICS FROM ISAR
        final clinics = await DBService.getClinics();

        /// 🔥 ROUTING LOGIC
        if (clinics.isEmpty) {
          /// ❌ No clinic → Profile
          Get.offAllNamed(routeprofilepage);
        } else if (clinics.length == 1) {
          /// ✅ One clinic → Auto select + Dashboard
          await DBService.saveSelectedClinic(clinics.first);

          Get.offAllNamed(routedashboard);
        } else {
          /// 🔥 Multiple clinics → Selection page
          Get.offAllNamed(routeclinicpage);
        }
      } else {
        Get.snackbar("Error", "Incorrect PIN");
      }
    } catch (e) {
      Get.snackbar("Error", "Verification failed");
    }
  }

  @override
  void onClose() {
    for (var c in pinBoxes) {
      c.dispose();
    }
    for (var c in confirmBoxes) {
      c.dispose();
    }
    for (var c in oldPinBoxes) {
      c.dispose();
    }
    for (var f in pinFocus) {
      f.dispose();
    }
    for (var f in confirmFocus) {
      f.dispose();
    }
    for (var f in oldPinFocus) {
      f.dispose();
    }
    super.onClose();
  }
}

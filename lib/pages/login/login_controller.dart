import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth_controller.dart';
import '../../services/db_service.dart';
import '../../routes/common/common_app_pages.dart';

class LoginController extends GetxController {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final isPasswordVisible = false.obs;

  final AuthService _authService = AuthService();

  @override
  void onClose() {
    loginController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// 🔥 FINAL LOGIN FLOW (PRODUCTION READY)
  Future<void> login() async {
    try {
      /// 🔥 GOOGLE SIGN-IN
      final result = await _authService.signInWithGoogle();

      if (result == null) {
        Get.snackbar(
          'Error',
          'Google Sign-In Failed',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final firebaseUser = result.user!;

      /// 🔥 CHECK EXISTING USER (IMPORTANT FIX)
      final existingUser = await DBService.getUser();

      if (existingUser == null) {
        /// 🆕 FIRST TIME LOGIN → SAVE USER
        await DBService.saveUser(firebaseUser);
      } else {
        /// 🔄 UPDATE USER DATA (KEEP PIN & DATA SAFE)
        await DBService.updateUser(firebaseUser);
      }

      final localUser = await DBService.getUser();

      Get.snackbar(
        'Success',
        'Login Successful',
        snackPosition: SnackPosition.BOTTOM,
      );

      /// 🔥 PIN FLOW
      if (localUser?.pinHash == null) {
        /// FIRST TIME → SET PIN
        Get.offAllNamed(
          routepinpage,
          arguments: {"isSet": true, "isReset": false},
        );
      } else {
        /// EXISTING → VERIFY PIN
        Get.offAllNamed(
          routepinpage,
          arguments: {"isSet": false, "isReset": false},
        );
      }
    } catch (e) {
      print("LOGIN ERROR: $e");

      Get.snackbar(
        'Error',
        'Login failed',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void goToRegister() {
    Get.toNamed(routeregisterpage);
  }
}

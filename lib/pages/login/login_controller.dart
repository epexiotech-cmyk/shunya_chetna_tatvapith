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

  /// 🔥 LOGIN FLOW (FIREBASE + ISAR CHECK)
  Future<void> login() async {
    try {
      /// 🔥 ALWAYS SIGN IN WITH GOOGLE
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

      /// 🔥 SAVE USER AGAIN (IMPORTANT AFTER REINSTALL)
      await DBService.saveUser(firebaseUser);

      final localUser = await DBService.getUser();

      Get.snackbar(
        'Success',
        'Login Successful',
        snackPosition: SnackPosition.BOTTOM,
      );

      /// 🔥 PIN FLOW
      if (localUser?.pinHash == null) {
        Get.offAllNamed(routepinpage,
            arguments: {"isSet": true, "isReset": false});
      } else {
        Get.offAllNamed(routepinpage,
            arguments: {"isSet": false, "isReset": false});
      }
    } catch (e) {
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

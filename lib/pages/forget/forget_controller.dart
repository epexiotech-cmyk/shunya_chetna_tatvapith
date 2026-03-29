import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth_controller.dart';
import '../../routes/common/common_app_pages.dart';

class ForgetController extends GetxController {
  final emailController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  /// 🔥 FIREBASE PASSWORD RESET
  Future<void> resetPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await _authService.sendPasswordResetEmail(emailController.text.trim());

      Get.snackbar(
        'Success',
        'Password reset link sent to your email',
        snackPosition: SnackPosition.BOTTOM,
      );

      /// 🔥 BACK TO LOGIN
      Get.offAllNamed(routeLoginpage);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send reset email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}

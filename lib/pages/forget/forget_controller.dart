import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
      Get.dialog(
        Center(
          child: Lottie.asset(
            'assets/animations/stethoscope.json',
            width: 120,
            height: 120,
          ),
        ),
        barrierColor: Colors.black.withOpacity(0.2),
        barrierDismissible: false,
      );

      /// 🔥 WAIT (LOADING TIME)
      await Future.delayed(const Duration(milliseconds: 2000));

      /// 🔥 YOUR ORIGINAL FUNCTION
      Get.snackbar(
        'Error',
        'Please enter email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );

      /// 🔥 CLOSE LOADER
      Get.back();

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

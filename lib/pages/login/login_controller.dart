import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../auth_controller.dart';
import '../../services/db_service.dart';
import '../../routes/common/common_app_pages.dart';

class LoginController extends GetxController {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;

  final AuthService _authService = AuthService();

  @override
  void onClose() {
    loginController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  Future<void> login() async {
    final email = loginController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Enter email & password');
      return;
    }

    try {
      /// 🔥 STEP 1: DB CHECK
      final user = await DBService.getUserByEmail(email);

      if (user == null) {
        Get.snackbar('Error', 'User not registered');
        return;
      }

      if (user.passwordHash == null ||
          !DBService.verifyPassword(password, user.passwordHash!)) {
        Get.snackbar('Error', 'Incorrect password');
        return;
      }

      /// 🔥 STEP 2: GOOGLE VERIFY
      final result = await _authService.signInWithGoogle();

      if (result == null) {
        Get.snackbar('Error', 'Google Sign-In Failed');
        return;
      }

      final firebaseUser = result.user!;

      if ((firebaseUser.email ?? "") != email) {
        Get.snackbar('Error', 'Google account mismatch');
        await _authService.signOut();
        return;
      }

      /// 🔥 SET USER LOGIN
      await DBService.setLoggedInUser(user);

      Get.snackbar('Success', 'Login Successful');

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
      /// 🔥 PIN FLOW
      Get.offAllNamed(
        routepinpage,
        arguments: {
          "isSet": user.pinHash == null,
          "isReset": false,
        },
      );

      /// 🔥 CLOSE LOADER
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Login failed');
    }
  }

  void goToRegister() {
    Get.toNamed(routeregisterpage);
  }
}

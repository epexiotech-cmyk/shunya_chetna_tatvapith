import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth_controller.dart';
import '../../services/db_service.dart';
import '../../routes/common/common_app_pages.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final AuthService _authService = AuthService();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.toggle();
  }

  Future<void> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    final name = nameController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      final result = await _authService.signInWithGoogle();

      if (result == null) {
        Get.snackbar('Error', 'Google Sign-In Failed');
        return;
      }

      final firebaseUser = result.user!;

      /// 🔥 EMAIL MATCH CHECK
      if ((firebaseUser.email ?? "") != email) {
        Get.snackbar('Error', 'Google email does not match');

        await _authService.signOut();
        return;
      }

      /// 🔥 CHECK EXISTING USER
      final existingUser = await DBService.getUserByEmail(email);

      if (existingUser != null) {
        Get.snackbar('Error', 'User already registered');
        return;
      }

      /// ✅ SAVE USER
      await DBService.saveUserWithPassword(
        firebaseUser,
        password,
        name,
      );

      Get.snackbar('Success', 'Registration Successful');

      /// 🔥 NAVIGATION (AUTO DISPOSE SAFE)
      Get.offAllNamed(
        routepinpage,
        arguments: {"isSet": true, "isReset": false},
      );
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  void goToLogin() {
    Get.back();
  }
}

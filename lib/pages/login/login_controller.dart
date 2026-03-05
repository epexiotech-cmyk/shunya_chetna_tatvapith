import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void login() {
    Get.offAndToNamed(routedashboard);
  }
  // void login() {
  //   if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
  //     Get.offAndToNamed(routedashboard);
  //     Get.snackbar(
  //       'Success',
  //       'Login functionality to be implemented',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } else {
  //     Get.snackbar(
  //       'Error',
  //       'Please enter email and password',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.redAccent,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  void goToRegister() {
    Get.toNamed(routeregisterpage);
  }

  void goToLogin() {
    Get.offAllNamed(routeLoginpage);
  }
}

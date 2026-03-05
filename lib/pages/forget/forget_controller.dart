import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';

class ForgetController extends GetxController {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void login() {
    if (mobileController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Get.offAndToNamed(routeLoginpage);
      Get.snackbar(
        'Success',
        'Forget functionality to be implemented',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please enter mobile and password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}

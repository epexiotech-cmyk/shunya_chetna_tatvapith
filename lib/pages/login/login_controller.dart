import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/common/common_app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    isLoading.value = true;

    // Simulate backend call
    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;
    Get.offNamed(routeDashboardpage);
  }
}

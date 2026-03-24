import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shunya_app/auth_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';

class LoginController extends GetxController {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final controller = Get.put(AuthController());
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    loginController.text = "harsh.rural@gmail.com";
    passwordController.text = "Harsh@1234";
    super.onInit();
  }

  @override
  void onClose() {
    loginController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> login() async {
    if (loginController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (controller.login(
        loginController.text, // <-- single input
        passwordController.text,
      )) {
        Get.snackbar(
          'Success',
          "Login Successful",
          snackPosition: SnackPosition.BOTTOM,
        );
        // Get.offAndToNamed(routedashboard);

        final storage = FlutterSecureStorage();
        String? pin = await storage.read(key: "app_pin");

        if (pin == null) {
          Get.offAllNamed(routepinpage, arguments: {"isSet": true});
        } else {
          Get.offAllNamed(routepinpage, arguments: {"isSet": false});
        }
      } else {
        Get.snackbar("Error", "Invalid Credentials");
      }
    } else {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void goToRegister() {
    Get.toNamed(routeregisterpage);
  }

  void goToLogin() {
    Get.offAllNamed(routeLoginpage);
  }
}

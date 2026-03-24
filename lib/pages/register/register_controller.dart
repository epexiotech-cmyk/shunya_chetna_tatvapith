import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/auth_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  // Registration specific controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final controller = Get.put(AuthController());

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    emailController.text = "harsh.rural@gmail.com";
    passwordController.text = "Harsh@1234";
    mobileController.text = "9714384251";
    nameController.text = "harsh patel";
    confirmPasswordController.text = "Harsh@1234";
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    mobileController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // void login() {
  //   if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
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

  void register() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      if (passwordController.text == confirmPasswordController.text) {
        controller.register(
          name: nameController.text,
          email: emailController.text,
          mobile: mobileController.text,
          password: passwordController.text,
        );
        Get.snackbar(
          'Success',
          "Registration Successful",
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(routeLoginpage);
      } else {
        Get.snackbar(
          'Error',
          'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
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

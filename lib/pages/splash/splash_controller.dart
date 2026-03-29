import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth_controller.dart';
import '../../services/db_service.dart';
import '../../routes/common/common_app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  final AuthService _authService = AuthService();

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.forward();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(seconds: 3), () {
      checkAppFlow();
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  /// 🔥 MAIN APP FLOW LOGIC
  Future<void> checkAppFlow() async {
    try {
      /// 🔹 Check Firebase user
      final firebaseUser = _authService.getCurrentUser();

      if (firebaseUser == null) {
        Get.offAllNamed(routeLoginpage);
        return;
      }

      /// 🔹 Check local user
      final localUser = await DBService.getUser();

      if (localUser == null) {
        Get.offAllNamed(routeLoginpage);
        return;
      }

      /// 🔹 Check PIN
      if (localUser.pinHash == null) {
        Get.offAllNamed(
          routepinpage,
          arguments: {"isSet": true},
        );
      } else {
        Get.offAllNamed(
          routepinpage,
          arguments: {"isSet": false},
        );
      }
    } catch (e) {
      Get.offAllNamed(routeLoginpage);
    }
  }
}

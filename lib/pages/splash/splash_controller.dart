import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shunya_app/auth_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  final auth = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(animationController);

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.bounceInOut,
          ),
        );

    animationController.forward();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 5), () {
      checkAppFlow();
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<void> checkAppFlow() async {
    final box = GetStorage();
    final storage = FlutterSecureStorage();

    /// LOGIN CHECK
    bool isLogin = box.read('isLogin') ?? false;

    if (!isLogin) {
      Get.offAllNamed(routeLoginpage);
      return;
    }

    /// PIN CHECK (🔥 STOP HERE)
    String? pin = await storage.read(key: "app_pin");

    if (pin == null) {
      Get.offAllNamed(routepinpage, arguments: {"isSet": true});
      return; // ✅ VERY IMPORTANT
    } else {
      Get.offAllNamed(routepinpage, arguments: {"isSet": false});
      return; // ✅ VERY IMPORTANT
    }
  }
}









 // Future<void> checkAppFlow() async {
  //   final sessionBox = GetStorage();
  //   bool isLogin = sessionBox.read('isLogin') ?? false;
  //   if (!isLogin) {
  //     Get.offAllNamed(routeLoginpage);
  //     return;
  //   }
  //   final storage = FlutterSecureStorage();
  //   String? pin = await storage.read(key: "app_pin");

  //   if (pin == null) {
  //     Get.offAllNamed(routepinpage, arguments: {"isSet": true});
  //   } else {
  //     Get.offAllNamed(routepinpage, arguments: {"isSet": false});
  //   }
  // }
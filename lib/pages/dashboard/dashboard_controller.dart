// import 'package:get/get.dart';

// class DashboardController extends GetxController {
//   // Dashboard logic will be implemented here
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt bottomNavIndex = 0.obs;

  late AnimationController hideBottomBarController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final iconList = <String>[
    "assets/images/patients.png",
    "assets/images/billing.png",
    "assets/images/inventory.png",
    "assets/images/disease.png",
  ];

  @override
  void onInit() {
    super.onInit();

    hideBottomBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  void changeIndex(int index) {
    bottomNavIndex.value = index;
  }

  @override
  void onClose() {
    hideBottomBarController.dispose();
    super.onClose();
  }
}

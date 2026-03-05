import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/inventory/inventory_controller.dart';
import 'package:shunya_app/utils/colors.dart';

class InventoryPage extends GetView<InventoryController> {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Center(
        child: Text(
          "Welcome Inventory",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

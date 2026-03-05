import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/billing/billing_controller.dart';
import 'package:shunya_app/utils/colors.dart';

class BillingPage extends GetView<BillingController> {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Center(
        child: Text(
          "Welcome Billing",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

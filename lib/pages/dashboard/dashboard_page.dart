import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/billing/billing_page.dart';
import 'package:shunya_app/pages/dashboard/buttom_bar.dart';
import 'package:shunya_app/pages/dashboard/drawer.dart' hide showDialoglogout;
import 'package:shunya_app/pages/disease/disease_page.dart';
import 'package:shunya_app/pages/inventory/add_inventory.dart';
import 'package:shunya_app/pages/inventory/inventory_page.dart';
import 'package:shunya_app/pages/patient/add_patient.dart';
import 'package:shunya_app/pages/patient/patient_page.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            key: controller.scaffoldKey,
            backgroundColor: AppColors.WHITE,
            appBar: CustomAppBarAction(
              title: controller.bottomNavIndex.value == 0
                  ? "Patients"
                  : controller.bottomNavIndex.value == 1
                  ? "Billing"
                  : controller.bottomNavIndex.value == 2
                  ? "Inventory"
                  : "Diseace",
              iconleft: Icons.menu,
              iconright: Icons.person_pin,
              lefticononTap: () {
                controller.scaffoldKey.currentState!.openDrawer();
              },
              righticononTap: () {
                Get.toNamed(routeprofilepage);
              },
            ),
            drawer: customdrawer(context: context),
            body: Obx(() {
              switch (controller.bottomNavIndex.value) {
                case 0:
                  return PatientPage();
                case 1:
                  return BillingPage();
                case 2:
                  return InventoryPage();
                case 3:
                  return DiseasePage();
                default:
                  return PatientPage();
              }
            }),
            bottomNavigationBar: Custombuttombar(),
            floatingActionButton: Obx(() {
              if (controller.bottomNavIndex.value == 0 ||
                  controller.bottomNavIndex.value == 2 ||
                  controller.bottomNavIndex.value == 3) {
                return FloatingActionButton.extended(
                  onPressed: () {
                    controller.bottomNavIndex.value == 0
                        ? Get.to(AddPatientPage())
                        : controller.bottomNavIndex.value == 2
                        ? Get.to(AddInventoryPage())
                        : showDialogDisease(context: context);
                  },
                  backgroundColor: AppColors.PRIMARY_COLOR,
                  icon: Icon(Icons.add, color: AppColors.WHITE),
                  label: CustomText(
                    text: controller.bottomNavIndex.value == 0
                        ? "Add Patients"
                        : controller.bottomNavIndex.value == 2
                        ? "Add Inventory"
                        : "Add Diseace",
                    fontSize: dp(context, 10),
                    color: AppColors.WHITE,
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
          );
        });
      },
    );
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/dashboard/dashboard_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';

class Custombuttombar extends GetView<DashboardController> {
  const Custombuttombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedBottomNavigationBar.builder(
        itemCount: controller.iconList.length,

        tabBuilder: (int index, bool isActive) {
          final color = isActive ? AppColors.WHITE : AppColors.LIGHT_GREY;

          return Padding(
            padding: EdgeInsets.only(top: hp(0.4)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  controller.iconList[index],
                  height: dp(context, 25),
                  width: dp(context, 25),
                  color: color,
                ),

                AutoSizeText(
                  _getLabel(index),
                  maxLines: 1,
                  style: TextStyle(color: color),
                ),
              ],
            ),
          );
        },

        activeIndex: controller.bottomNavIndex.value,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        backgroundColor: AppColors.PRIMARY_COLOR,
        splashColor: AppColors.WHITE,
        onTap: controller.changeIndex,
        hideAnimationController: controller.hideBottomBarController,
        leftCornerRadius: dp(context, 30),
        rightCornerRadius: dp(context, 30),
      ),
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "Patients";
      case 1:
        return "Billing";
      case 2:
        return "Inventory";
      case 3:
        return "Disease";
      default:
        return "";
    }
  }
}

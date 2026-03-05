import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          body: Center(
            child: FadeTransition(
              opacity: controller.fadeAnimation,
              child: SlideTransition(
                position: controller.slideAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/splash_logo.png',
                      scale: dp(context, 2.3),
                      color: AppColors.PRIMARY_COLOR,
                    ),

                    SizedBox(height: hp(2)),

                    CustomText(text: "Patient Management System"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

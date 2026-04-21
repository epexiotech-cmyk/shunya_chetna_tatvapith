import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shunya_app/auth_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/customcontainer.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: strict_top_level_inference
customdrawer({required BuildContext context}) {
  return Drawer(
    backgroundColor: AppColors.WHITE,
    child: Stack(
      children: [
        ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: hp(1), left: wp(2), right: wp(2)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/splash_logo.png',
                    height: hp(5),
                    color: AppColors.PRIMARY_COLOR,
                  ),
                  SizedBox(width: wp(2)),

                  /// SCROLLING TITLE
                  Expanded(
                    child: SizedBox(
                      height: hp(3.5),
                      child: Marquee(
                        text: "Patient Management System",
                        style: TextStyle(
                          fontSize: dp(context, 20),
                          color: AppColors.PRIMARY_COLOR,
                          fontWeight: FontWeight.w500,
                        ),
                        scrollAxis: Axis.horizontal,
                        blankSpace: 100,
                        velocity: 40,
                        pauseAfterRound: const Duration(seconds: 1),
                        startPadding: 10,
                      ),
                    ),
                  ),

                  /// LOGO
                ],
              ),
            ),
            SizedBox(height: hp(2)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: wp(3), vertical: hp(2)),
              decoration: BoxDecoration(
                color: AppColors.PRIMARY_COLOR,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(60)),
              ),
              child: Row(
                children: [
                  /// PROFILE IMAGE
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.WHITE, width: wp(0.5)),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppColors.PRIMARY_COLOR,
                      radius: dp(context, 25),
                      child: Image.asset(
                        'assets/images/splash_logo.png',
                        color: AppColors.WHITE,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  SizedBox(width: wp(4)),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Shunya Chetna Tatvapith",
                          color: AppColors.WHITE,
                          fontSize: dp(context, 12),
                        ),
                        SizedBox(height: hp(0.5)),
                        CustomText(
                          text: "apurvpatel9112@gmail.com",
                          color: AppColors.WHITE,
                          fontSize: dp(context, 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Customcontainer(
              margin: EdgeInsets.only(top: hp(1), left: wp(2), right: wp(2)),
              padding: EdgeInsets.only(left: wp(5)),
              mainAxisAlignment: MainAxisAlignment.start,
              context: context,
              icon: Icons.refresh_sharp,
              text: "Refresh Data",
              color: AppColors.WHITE,
              bordercolor: AppColors.LIGHT_GREY,
            ),
            Customcontainer(
              margin: EdgeInsets.only(top: hp(1), left: wp(2), right: wp(2)),
              padding: EdgeInsets.only(left: wp(5)),
              mainAxisAlignment: MainAxisAlignment.start,
              context: context,
              icon: Icons.logout_sharp,
              text: "Logout",
              color: AppColors.WHITE,
              bordercolor: AppColors.LIGHT_GREY,
              onTap: () {
                showDialoglogout(context: context);
              },
            ),
            Customcontainer(
              margin: EdgeInsets.only(top: hp(1), left: wp(2), right: wp(2)),
              padding: EdgeInsets.only(left: wp(5)),
              mainAxisAlignment: MainAxisAlignment.start,
              context: context,
              icon: Icons.logout_sharp,
              text: "Reset PIN",
              color: AppColors.WHITE,
              bordercolor: AppColors.LIGHT_GREY,
              onTap: () async {
                const storage = FlutterSecureStorage();

                await storage.delete(key: "app_pin");

                Get.toNamed(
                  routepinpage,
                  arguments: {"isSet": false, "isReset": true},
                );
              },
            ),
            Positioned(
              bottom: hp(2),
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: hp(40),
                    ),
                    Divider(color: AppColors.LIGHT_GREY),
                    SizedBox(height: hp(3)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: wp(5),
                        ),
                        CustomText(
                          text: "Powered By ",
                          color: AppColors.DARK,
                          fontSize: dp(context, 12),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launchUrl(
                              Uri.parse("https://epexio.in"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: CustomText(
                            text: "Epexio Techno Solution",
                            color: AppColors.PRIMARY_COLOR,
                            fontSize: dp(context, 12),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

void showDialoglogout({required BuildContext context}) {
  final AuthService authService = AuthService();
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: AppColors.WHITE,
        titleTextStyle: TextStyle(
          color: Colors.red,
          fontSize: dp(context, 24),
          fontStyle: FontStyle.italic,
        ),
        title: const Text("Logout", textAlign: TextAlign.center),
        content: const Text(
          "Are You Sure You want to Logout.",
          textAlign: TextAlign.center,
        ),
        contentTextStyle: TextStyle(
          fontSize: dp(context, 15),
          color: AppColors.DARK,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// YES BUTTON
              Customcontainer(
                onTap: () {
                  authService.signOut();
                  Get.offAllNamed(routeLoginpage);
                },
                context: context,
                width: wp(32),
                text: "Yes",
                textcolor: AppColors.WHITE,
                color: Colors.red,
              ),

              SizedBox(width: wp(2)),

              /// NO BUTTON
              Customcontainer(
                onTap: () {
                  Get.back();
                },
                width: wp(32),
                context: context,
                text: "No",
                textcolor: AppColors.WHITE,
                color: AppColors.PRIMARY_COLOR,
              ),
            ],
          ),
        ],
      );
    },
  );
}

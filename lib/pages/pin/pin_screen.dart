import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/pin/pin_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PinController());

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.WHITE,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// LOGO
                  Image.asset(
                    'assets/images/splash_logo.png',
                    scale: dp(context, 2.3),
                    color: AppColors.PRIMARY_COLOR,
                  ),

                  SizedBox(height: hp(2)),

                  /// TITLE
                  CustomText(
                    text: controller.isResetMode.value
                        ? "Reset Security PIN"
                        : controller.isSetMode.value
                        ? "Set Security PIN"
                        : "Enter Security PIN",
                  ),

                  SizedBox(height: hp(4)),

                  /// ================================
                  /// 🟢 SET / RESET PIN
                  /// ================================
                  if (controller.isSetMode.value ||
                      controller.isResetMode.value) ...[
                    /// ENTER PIN
                    pinRow(context, controller.pinBoxes, controller.pinFocus),

                    SizedBox(height: hp(2)),

                    /// CONFIRM PIN
                    pinRow(
                      context,
                      controller.confirmBoxes,
                      controller.confirmFocus,
                    ),

                    SizedBox(height: hp(4)),

                    Customcontainer(
                      text: controller.isResetMode.value
                          ? "Reset PIN"
                          : "Set PIN",
                      context: context,
                      onTap: controller.saveOrResetPin,
                    ),
                  ]
                  /// ================================
                  /// 🔵 LOGIN PIN
                  /// ================================
                  else ...[
                    pinRow(context, controller.pinBoxes, controller.pinFocus),

                    SizedBox(height: hp(1)),

                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            '/pin',
                            arguments: {"isSet": false, "isReset": true},
                          );
                        },
                        child: CustomText(
                          text: "Reset PIN?",
                          color: AppColors.PRIMARY_COLOR,
                          fontSize: dp(context, 12),
                        ),
                      ),
                    ),

                    SizedBox(height: hp(4)),

                    Customcontainer(
                      text: "Unlock",
                      context: context,
                      onTap: controller.verifyPin,
                    ),
                  ],
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  /// 🔥 PIN BOX ROW
  Widget pinRow(
    BuildContext context,
    List<TextEditingController> controllers,
    List<FocusNode> focusNodes,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: wp(15),
          margin: EdgeInsets.symmetric(horizontal: wp(2)),
          child:
              // CustomTextField(
              //   controller: controllers[index],
              //   focusNode: focusNodes[index],
              //   keyboardType: TextInputType.number,
              //   obscureText: true,
              //   textAlign: TextAlign.center,
              //   maxLength: 1,
              //   /// 🔥 AUTO MOVE
              //   onchange: (value) {
              //     if (value.isNotEmpty) {
              //       if (index < 3) {
              //         FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              //       } else {
              //         FocusScope.of(context).unfocus();
              //       }
              //     } else {
              //       if (index > 0) {
              //         FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              //       }
              //     }
              //   },
              // ),
              TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                keyboardType: TextInputType.number,
                obscureText: true,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: const TextStyle(fontSize: 22),
                cursorColor: AppColors.PRIMARY_COLOR,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.PRIMARY_COLOR),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.PRIMARY_COLOR),
                    borderRadius: BorderRadius.circular(dp(context, 10)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(dp(context, 10)),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(dp(context, 10)),
                  ),
                ),

                /// 🔥 AUTO MOVE
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if (index < 3) {
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index + 1]);
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                  } else {
                    if (index > 0) {
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index - 1]);
                    }
                  }
                },
              ),
        );
      }),
    );
  }
}

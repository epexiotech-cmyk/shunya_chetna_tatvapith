import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:shunya_app/dependency_injection.dart';
import 'package:shunya_app/pages/forget/forget_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: wp(5),
                  vertical: hp(2),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/splash_logo.png',
                      scale: dp(context, 2.3),
                      color: AppColors.PRIMARY_COLOR,
                    ),

                    SizedBox(height: hp(2)),
                    const CustomText(text: "PMS Forget Password"),

                    SizedBox(height: hp(4)),
                    // Email Field
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: controller.emailController,
                      hint: "Email",
                      labeltext: 'Email',
                      validator: formValidation.validation(
                        type: 'email',
                        multiValidator: MultiValidator([]),
                        isRequired: true,
                        errorText: "Email is required.",
                      ),
                      prefixicon: Icon(
                        Icons.phone,
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    ),

                    SizedBox(height: hp(3)),

                    // Login Button
                    Customcontainer(
                      text: "Forget Password",
                      context: context,
                      onTap: controller.resetPassword,
                    ),
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

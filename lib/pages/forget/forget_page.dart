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
                    CustomText(text: "PMS Forget Password"),

                    SizedBox(height: hp(4)),
                    // Email Field
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: controller.mobileController,
                      hint: "Mobile",
                      labeltext: 'Mobile',
                      validator: formValidation.validation(
                        type: 'mobile',
                        multiValidator: MultiValidator([]),
                        isRequired: true,
                        errorText: "Mobile is required.",
                      ),
                      prefixicon: Icon(
                        Icons.phone,
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    ),
                    SizedBox(height: hp(2)),

                    // Password Field
                    CustomTextField(
                      obscureText: !controller.isPasswordVisible.value,
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      hint: 'Password',
                      labeltext: 'Password',
                      validator: formValidation.validation(
                        type: 'password',
                        multiValidator: MultiValidator([]),
                        isRequired: true,
                        errorText: "Password is required.",
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      prefixicon: Icon(
                        Icons.lock_outline,
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    ),
                    SizedBox(height: hp(2)),
                    CustomTextField(
                      obscureText: !controller.isPasswordVisible.value,
                      controller: controller.confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      hint: 'Confirm Password',
                      labeltext: 'Confirm Password',
                      validator: formValidation.validation(
                        type: 'password',
                        multiValidator: MultiValidator([]),
                        isRequired: true,
                        errorText: "Confirm Password is required.",
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      prefixicon: Icon(
                        Icons.lock_outline,
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    ),

                    SizedBox(height: hp(3)),

                    // Login Button
                    Customcontainer(
                      text: "Forget Password",
                      context: context,
                      onTap: controller.login,
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

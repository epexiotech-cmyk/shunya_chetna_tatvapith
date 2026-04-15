import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:shunya_app/dependency_injection.dart';
import 'package:shunya_app/pages/login/login_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                    const CustomText(text: "PMS Doctor Login"),

                    SizedBox(height: hp(4)),
                    // Email Field
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: controller.loginController,
                      hint: "Email / Mobile / Name",
                      labeltext: "Email / Mobile / Name",
                      validator: formValidation.validation(
                        type: 'name',
                        multiValidator: MultiValidator([]),
                        isRequired: true,
                        errorText: "Field is required.",
                      ),
                      prefixicon: Icon(
                        Icons.email_outlined,
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
                    Padding(
                      padding: EdgeInsets.only(top: hp(1), left: wp(52)),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(routeforgetpage);
                        },
                        child: CustomText(
                          text: "Forget Password?",
                          color: AppColors.PRIMARY_COLOR,
                          fontSize: dp(context, 12),
                        ),
                      ),
                    ),
                    SizedBox(height: hp(3)),

                    // Login Button
                    Customcontainer(
                      text: "LOGIN",
                      context: context,
                      onTap: controller.login,
                    ),
                    SizedBox(height: hp(3)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Don't have an account? ",
                          color: AppColors.LIGHT_GREY,
                          fontSize: dp(context, 12),
                        ),
                        InkWell(
                          onTap: () => controller.goToRegister(),
                          child: CustomText(
                            text: "Create Account",
                            color: AppColors.PRIMARY_COLOR,
                            fontSize: dp(context, 12),
                          ),
                        ),
                      ],
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

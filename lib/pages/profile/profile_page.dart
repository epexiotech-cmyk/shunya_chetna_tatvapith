import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/profile/profile_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: CustomAppBarAction(
        title: "Profile",
        iconleft: Icons.arrow_back_ios_rounded,
        lefticononTap: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),
          child: Obx(
            () => Column(
              children: [
                /// Doctor Fields
                CustomTextField(
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  controller: controller.nameController,
                  hint: "Doctor Name",
                  labeltext: 'Doctor Name',
                  prefixicon: Icon(
                    Icons.person_2_outlined,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),

                SizedBox(height: hp(2)),

                CustomTextField(
                  readOnly: true,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  hint: "Email Id",
                  labeltext: 'Email Id',
                  prefixicon: Icon(
                    Icons.email_outlined,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),

                SizedBox(height: hp(2)),

                CustomTextField(
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  controller: controller.mobileController,
                  hint: "Mobile No",
                  labeltext: 'Mobile No',
                  prefixicon: Icon(
                    Icons.phone_outlined,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),

                SizedBox(height: hp(2)),

                CustomTextField(
                  controller: controller.qualificationController,
                  hint: "Qualification",
                  labeltext: 'Qualification',
                  prefixicon: Icon(
                    Icons.local_hospital_outlined,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),

                SizedBox(height: hp(3)),

                /// Clinics Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Clinics",
                      fontSize: dp(context, 16),
                      // fontWeight: FontWeight.bold,
                    ),

                    ElevatedButton.icon(
                      onPressed: controller.addClinic,
                      icon: Icon(
                        Icons.add,
                        color: AppColors.WHITE,
                        size: dp(context, 15),
                      ),
                      label: CustomText(
                        text: "Add Clinic",
                        fontSize: dp(context, 8),
                        color: AppColors.WHITE,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.PRIMARY_COLOR, // Button background color
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: hp(2)),

                /// Dynamic Clinic Fields
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.clinicList.length,
                  itemBuilder: (context, index) {
                    final clinic = controller.clinicList[index];

                    return Column(
                      children: [
                        CustomTextField(
                          controller: clinic.nameController,
                          hint: "Clinic Name",
                          labeltext: "Clinic Name",
                          prefixicon: Icon(
                            Icons.local_hospital,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                        ),

                        SizedBox(height: hp(2)),

                        CustomTextField(
                          controller: clinic.addressController,
                          hint: "Clinic Address",
                          labeltext: "Clinic Address",
                          maxLines: 3,
                          prefixicon: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                        ),

                        SizedBox(height: hp(2)),

                        if (index != 0)
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                controller.removeClinic(index);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                SizedBox(height: hp(3)),

                Customcontainer(text: "Save", context: context, onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

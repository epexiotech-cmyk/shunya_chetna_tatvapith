import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/patient/patient_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientController>(
      init: PatientController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          body: Padding(
            padding: EdgeInsets.only(top: hp(2), left: wp(5), right: wp(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: controller.searchController,
                  hint: "Search Patient",
                  labeltext: 'Search Patient',

                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      padding: EdgeInsets.all(wp(0.2)),
                      itemCount: controller.patientList.length,
                      itemBuilder: (context, index) {
                        final patient = controller.patientList[index];

                        return Card(
                          color: AppColors.WHITE,
                          elevation: dp(context, 1),
                          shadowColor: AppColors.PRIMARY_COLOR,
                          margin: EdgeInsets.only(bottom: hp(1.5)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: ListTile(
                            /// NAME
                            title: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: dp(context, 16),
                                  color: AppColors.PRIMARY_COLOR,
                                ),
                                SizedBox(width: wp(2)),
                                CustomText(
                                  text: patient["name"] ?? "",
                                  color: AppColors.PRIMARY_COLOR,
                                  fontSize: dp(context, 16),
                                  fontStyle: FontStyle.normal,
                                ),
                              ],
                            ),

                            /// MOBILE + ADDRESS
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: hp(0.5)),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: dp(context, 16),
                                      color: AppColors.PRIMARY_COLOR,
                                    ),
                                    SizedBox(width: wp(2)),
                                    CustomText(
                                      text: patient["mobile"] ?? "",
                                      color: AppColors.DARK,
                                      fontSize: dp(context, 13),
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ],
                                ),

                                SizedBox(height: hp(0.5)),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: dp(context, 16),
                                      color: AppColors.PRIMARY_COLOR,
                                    ),
                                    SizedBox(width: wp(2)),
                                    Expanded(
                                      child: CustomText(
                                        text: patient["address"] ?? "",
                                        color: AppColors.DARK,
                                        fontSize: dp(context, 12),
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.PRIMARY_COLOR,
                              size: dp(context, 16),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

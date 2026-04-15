import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/clinic/clinic_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_text.dart';

class ClinicPage extends StatelessWidget {
  const ClinicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClinicController>(
      init: ClinicController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          appBar: const CustomAppBarAction(title: "Clinic's"),
          body: ListView.builder(
            padding: EdgeInsets.only(top: hp(2), left: wp(5), right: wp(5)),
            itemCount: controller.clinicList.length,
            itemBuilder: (context, index) {
              final clinic = controller.clinicList[index];

              return GestureDetector(
                  onTap: () {
                    controller.selectClinic(clinic);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: hp(1)),
                    decoration: BoxDecoration(
                      color: AppColors.WHITE,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.LIGHT_GREY),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.LIGHT_GREY.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                              0, 3), // changes position of shadow (right, down)
                        ),
                      ],
                    ),
                    child: ListTile(
                      /// NAME
                      title: Row(
                        children: [
                          Icon(
                            Icons.local_hospital,
                            size: dp(context, 16),
                            color: AppColors.PRIMARY_COLOR,
                          ),
                          SizedBox(width: wp(2)),
                          CustomText(
                            text: clinic.clinicName,
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
                                Icons.person,
                                size: dp(context, 16),
                                color: AppColors.PRIMARY_COLOR,
                              ),
                              SizedBox(width: wp(2)),
                              CustomText(
                                text: clinic.doctorName,
                                color: AppColors.DARK,
                                fontSize: dp(context, 13),
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                          SizedBox(height: hp(0.5)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: dp(context, 16),
                                color: AppColors.PRIMARY_COLOR,
                              ),
                              SizedBox(width: wp(2)),
                              Expanded(
                                child: CustomText(
                                  text: clinic.address,
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
                  )

                  // Card(
                  //   color: AppColors.WHITE,
                  //   elevation: dp(context, 1),
                  //   shadowColor: AppColors.PRIMARY_COLOR,
                  //   margin: EdgeInsets.only(bottom: hp(1.5)),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(16),
                  //   ),
                  //   child:
                  // ),
                  );
            },
          ),
        );
      },
    );
  }
}

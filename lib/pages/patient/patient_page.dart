import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/patient/patient_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadPatients();
    });
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Padding(
        padding: EdgeInsets.only(top: hp(2), left: wp(5), right: wp(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              textInputAction: TextInputAction.next,
              controller: controller.searchController,
              hint: "Search Patient",
              labeltext: 'Search Patient',
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.PRIMARY_COLOR,
              ),
              onchange: (value) {
                controller.filterPatients();
              },
            ),
            SizedBox(height: hp(2)),
            Expanded(
              child: Obx(() {
                if (controller.filteredList.isEmpty) {
                  return Center(
                      child: CustomText(
                    text: "No Patients Found",
                    fontStyle: FontStyle.normal,
                    color: AppColors.DARK,
                    fontSize: dp(context, 10),
                  ));
                }
                return ListView.builder(
                  padding: EdgeInsets.all(wp(0.2)),
                  itemCount: controller.filteredList.length,
                  itemBuilder: (context, index) {
                    final patient = controller.filteredList[index];

                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          routeaddpatient,
                          arguments: {
                            "patientList": patient,
                            "index": controller.patientList.indexOf(patient),
                          },
                        );
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
                              offset: const Offset(0,
                                  3), // changes position of shadow (right, down)
                            ),
                          ],
                        ),
                        child: ListTile(
                          /// NAME
                          title: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: dp(context, 24),
                                color: AppColors.PRIMARY_COLOR,
                              ),
                              SizedBox(width: wp(2)),
                              CustomText(
                                text: patient.name,
                                color: AppColors.PRIMARY_COLOR,
                                fontSize: dp(context, 24),
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
                                    size: dp(context, 20),
                                    color: AppColors.PRIMARY_COLOR,
                                  ),
                                  SizedBox(width: wp(2)),
                                  CustomText(
                                    text: patient.mobile,
                                    color: AppColors.DARK,
                                    fontSize: dp(context, 20),
                                    fontStyle: FontStyle.normal,
                                  ),
                                ],
                              ),
                              SizedBox(height: hp(0.5)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: dp(context, 18),
                                    color: AppColors.PRIMARY_COLOR,
                                  ),
                                  SizedBox(width: wp(2)),
                                  Expanded(
                                    child: CustomText(
                                      text: patient.village,
                                      color: AppColors.DARK,
                                      fontSize: dp(context, 18),
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  if (index < controller.filteredList.length) {
                                    controller.deletePatient(patient);
                                  }
                                },
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.PRIMARY_COLOR,
                                size: dp(context, 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

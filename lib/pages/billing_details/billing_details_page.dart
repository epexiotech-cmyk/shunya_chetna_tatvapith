import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shunya_app/pages/billing_details/billing_details_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class BillingDetailsPage extends StatelessWidget {
  const BillingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillingDetailsController>(
      init: BillingDetailsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          appBar: CustomAppBarAction(
            title: "Patient Bill",
            iconleft: Icons.arrow_back_ios_rounded,
            lefticononTap: () {
              Get.back();
            },
            iconright: Icons.share,
            righticononTap: () async {
              controller.sendWhatsAppMessage();
            },
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(wp(4)),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(wp(4)),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.LIGHT_GREY),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// DOCTOR DETAILS
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Dr. ${controller.doctorName}",
                              color: AppColors.DARK,
                              fontSize: dp(context, 16),
                              fontStyle: FontStyle.normal,
                            ),
                            CustomText(
                              text: controller.doctorMobile,
                              color: AppColors.DARK,
                              fontSize: dp(context, 14),
                              fontStyle: FontStyle.normal,
                            ),
                          ],
                        ),
                        SizedBox(height: hp(1)),
                        Center(
                          child: CustomText(
                            text: controller.clinicName,
                            color: AppColors.DARK,
                            fontSize: dp(context, 14),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Center(
                          child: CustomText(
                            text: controller.clinicAddress,
                            color: AppColors.DARK,
                            fontSize: dp(context, 14),
                            fontStyle: FontStyle.normal,
                          ),
                        ),

                        SizedBox(height: hp(1)),

                        const Divider(),

                        /// BILL DETAILS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Bill No : ${controller.billNo}",
                              color: AppColors.DARK,
                              fontSize: dp(context, 12),
                              fontStyle: FontStyle.normal,
                            ),
                            CustomText(
                              text: "Date : ${controller.billDate}",
                              color: AppColors.DARK,
                              fontSize: dp(context, 12),
                              fontStyle: FontStyle.normal,
                            ),
                          ],
                        ),

                        SizedBox(height: hp(1)),

                        /// PATIENT DETAILS
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// PATIENT INFO
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Patient : ${controller.patientName}",
                                    color: AppColors.DARK,
                                    fontSize: dp(context, 12),
                                    fontStyle: FontStyle.normal,
                                  ),
                                  CustomText(
                                    text:
                                        "Mobile : ${controller.patientMobile}",
                                    color: AppColors.DARK,
                                    fontSize: dp(context, 12),
                                    fontStyle: FontStyle.normal,
                                  ),
                                  CustomText(
                                    text: "City : ${controller.patientCity}",
                                    color: AppColors.DARK,
                                    fontSize: dp(context, 12),
                                    fontStyle: FontStyle.normal,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Divider(),

                        /// TABLE HEADER
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomText(
                                text: "No.",
                                color: AppColors.DARK,
                                fontSize: dp(context, 12),
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: CustomText(
                                text: "Medicine",
                                color: AppColors.DARK,
                                fontSize: dp(context, 12),
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                text: "Qty",
                                color: AppColors.DARK,
                                fontSize: dp(context, 12),
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                text: "Price",
                                color: AppColors.DARK,
                                fontSize: dp(context, 12),
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),

                        const Divider(),

                        /// MEDICINE LIST
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.medicineList.length,
                          itemBuilder: (context, index) {
                            final med = controller.medicineList[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: hp(0.5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CustomText(
                                      text: "${index + 1}",
                                      color: AppColors.DARK,
                                      fontSize: dp(context, 12),
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: med["name"],
                                          color: AppColors.DARK,
                                          fontSize: dp(context, 12),
                                          fontStyle: FontStyle.normal,
                                        ),
                                        SizedBox(height: hp(0.5)),
                                        CustomText(
                                          text: med["use"],
                                          color: AppColors.DARK,
                                          fontSize: dp(context, 10),
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: CustomText(
                                      text: med["qty"].toString(),
                                      color: AppColors.DARK,
                                      fontSize: dp(context, 12),
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: CustomText(
                                      text: "₹${med["qty"] * med["price"]}",
                                      color: AppColors.DARK,
                                      fontSize: dp(context, 12),
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        const Divider(),

                        /// TOTAL
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: "Total : ₹${controller.totalAmount}",
                              color: AppColors.DARK,
                              fontSize: dp(context, 18),
                              fontStyle: FontStyle.normal,
                            ),
                          ],
                        ),

                        SizedBox(height: hp(2)),

                        /// QR CODE
                        Center(
                          child: CustomText(
                            text: "Scan & Pay",
                            color: AppColors.DARK,
                            fontSize: dp(context, 14),
                            fontStyle: FontStyle.normal,
                          ),
                        ),

                        SizedBox(height: hp(0.5)),

                        Center(
                          child: QrImageView(
                            data: controller.upiUrl,
                            size: dp(context, 100),
                          ),
                        ),
                        SizedBox(height: hp(1)),
                        Center(
                          child: CustomText(
                            text: "Thank You",
                            color: AppColors.DARK,
                            fontSize: dp(context, 14),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: hp(1)),
                  Customcontainer(
                    context: context,
                    text: "Back to Home",
                    onTap: () {
                      Get.offAllNamed(routedashboard);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

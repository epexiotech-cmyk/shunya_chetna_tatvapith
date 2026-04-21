import 'dart:convert';

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
            title: controller.isHistory ? "Visit History" : "Patient Bill",
            iconleft: Icons.arrow_back_ios_rounded,
            lefticononTap: () => Get.back(),
            iconright: controller.isHistory ? null : Icons.share,
            righticononTap: () {
              if (!controller.isHistory) {
                controller.sendWhatsAppMessage();
              }
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
                        /// HEADER (only bill mode)
                        if (!controller.isHistory) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: "Dr. ${controller.doctorName}",
                                  fontStyle: FontStyle.normal,
                                  fontSize: dp(context, 16)),
                              CustomText(
                                  text: controller.doctorMobile,
                                  fontStyle: FontStyle.normal,
                                  fontSize: dp(context, 14)),
                            ],
                          ),
                          SizedBox(height: hp(1)),
                          Center(
                              child: CustomText(
                            text: controller.clinicName,
                            fontSize: dp(context, 14),
                            fontStyle: FontStyle.normal,
                          )),
                          Center(
                              child: CustomText(
                                  text: controller.clinicAddress,
                                  fontStyle: FontStyle.normal,
                                  fontSize: dp(context, 14))),
                          SizedBox(height: hp(1)),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: "Bill No : ${controller.billNo}",
                                  fontStyle: FontStyle.normal,
                                  fontSize: dp(context, 12)),
                              CustomText(
                                  text: "Date : ${controller.billDate}",
                                  fontStyle: FontStyle.normal,
                                  fontSize: dp(context, 12)),
                            ],
                          ),
                          SizedBox(height: hp(1)),
                        ],

                        /// PATIENT DETAILS
                        CustomText(
                          text: "Patient : ${controller.patientName}",
                          fontStyle: FontStyle.normal,
                          fontSize: dp(context, 12),
                        ),
                        CustomText(
                          text: "Mobile : ${controller.patientMobile}",
                          fontStyle: FontStyle.normal,
                          fontSize: dp(context, 12),
                        ),
                        CustomText(
                          text: "Address : ${controller.patientCity}",
                          fontStyle: FontStyle.normal,
                          fontSize: dp(context, 12),
                        ),

                        const Divider(),

                        /// ================= BILL MODE =================
                        if (!controller.isHistory) ...[
                          /// TABLE HEADER
                          const Row(
                            children: [
                              Expanded(child: Text("No.")),
                              Expanded(flex: 3, child: Text("Medicine")),
                              Expanded(child: Text("Qty")),
                              Expanded(child: Text("Price")),
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

                              final qty =
                                  int.tryParse(med["qty"].toString()) ?? 0;
                              final price =
                                  int.tryParse(med["price"].toString()) ?? 0;

                              return Row(
                                children: [
                                  Expanded(child: Text("${index + 1}")),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      med["name"],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(child: Text("$qty")),
                                  Expanded(child: Text("₹${qty * price}")),
                                ],
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
                                fontSize: dp(context, 18),
                              ),
                            ],
                          ),

                          SizedBox(height: hp(2)),

                          /// QR
                          const Center(child: Text("Scan & Pay")),
                          SizedBox(height: hp(1)),

                          Center(
                            child: QrImageView(
                              data: controller.upiUrl,
                              size: dp(context, 100),
                            ),
                          ),

                          SizedBox(height: hp(1)),

                          const Center(child: Text("Thank You")),
                        ]

                        /// ================= HISTORY MODE =================
                        else ...[
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.visitList.length,
                            itemBuilder: (context, index) {
                              final visit = controller.visitList[index];
                              final medicines = visit.medicinesJson != null
                                  ? List<Map<String, dynamic>>.from(
                                      jsonDecode(visit.medicinesJson!))
                                  : [];
                              // final medicines = visit.medicines ?? [];
                              // print("visit.disease :::: ${visit.disease}");

                              return Container(
                                margin: EdgeInsets.only(bottom: hp(1)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: wp(1.5), vertical: hp(1)),
                                decoration: BoxDecoration(
                                  color: AppColors.WHITE,
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                      Border.all(color: AppColors.LIGHT_GREY),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.LIGHT_GREY.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Visit Date : ${visit.date ?? ""}"),
                                    SizedBox(height: hp(1)),

                                    Text("Problem : ${visit.problem ?? ""}"),
                                    SizedBox(height: hp(1)),

                                    Text(
                                        "Observation : ${visit.observation ?? ""}"),
                                    SizedBox(height: hp(1)),

                                    /// ✅ DISEASE
                                    if (visit.disease != null &&
                                        visit.disease.toString().isNotEmpty)
                                      Text("Disease : ${visit.disease}"),

                                    const Divider(),

                                    ExpansionTile(
                                      title: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 3, child: Text("Medicine")),
                                          Expanded(child: Text("Qty")),
                                        ],
                                      ),
                                      children: medicines.map((med) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: wp(2),
                                              vertical: hp(0.5)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  med["name"],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text("${med["qty"]}"),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),

                                    /// 🔥 PDF DROPDOWN
                                    if (visit.pdfPaths != null &&
                                        visit.pdfPaths.isNotEmpty)
                                      ExpansionTile(
                                        title: const Text("Report PDF"),
                                        children:
                                            visit.pdfPaths.map<Widget>((path) {
                                          return ListTile(
                                            title: Text(path.split('/').last),
                                            trailing: const Icon(
                                                Icons.picture_as_pdf),
                                            onTap: () {
                                              controller
                                                  .openPdf(path); // 🔥 open PDF
                                            },
                                          );
                                        }).toList(),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: hp(1)),
                  if (!controller.isHistory)
                    Customcontainer(
                      context: context,
                      text: "Back to Home",
                      onTap: () {
                        if (controller.isHistory) {
                          Get.back();
                        } else {
                          Get.offAllNamed(routedashboard);
                        }
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

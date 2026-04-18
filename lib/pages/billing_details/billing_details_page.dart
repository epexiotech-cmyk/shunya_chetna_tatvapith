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

// class BillingDetailsPage extends StatelessWidget {
//   const BillingDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BillingDetailsController>(
//       init: BillingDetailsController(),
//       builder: (controller) {
//         return Scaffold(
//           backgroundColor: AppColors.WHITE,
//           appBar: CustomAppBarAction(
//             title: "Patient Bill",
//             iconleft: Icons.arrow_back_ios_rounded,
//             lefticononTap: () {
//               Get.back();
//             },
//             iconright: Icons.share,
//             righticononTap: () async {
//               controller.sendWhatsAppMessage();
//             },
//           ),
//           body: SafeArea(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(wp(4)),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(wp(4)),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColors.LIGHT_GREY),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// DOCTOR DETAILS
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // billing ma
//                             CustomText(
//                               text: "Dr. ${controller.doctorName}",
//                               color: AppColors.DARK,
//                               fontSize: dp(context, 16),
//                               fontStyle: FontStyle.normal,
//                             ),// billing ma
//                             CustomText(
//                               text: controller.doctorMobile,
//                               color: AppColors.DARK,
//                               fontSize: dp(context, 14),
//                               fontStyle: FontStyle.normal,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: hp(1)),
//                         // billing ma
//                         Center(
//                           child: CustomText(
//                             text: controller.clinicName,
//                             color: AppColors.DARK,
//                             fontSize: dp(context, 14),
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),
//                         // billing ma
//                         Center(
//                           child: CustomText(
//                             text: controller.clinicAddress,
//                             color: AppColors.DARK,
//                             fontSize: dp(context, 14),
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),

//                         SizedBox(height: hp(1)),

//                         const Divider(),

//                         /// BILL DETAILS
//                         /// // billing ma
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(
//                               text: "Bill No : ${controller.billNo}",
//                               color: AppColors.DARK,
//                               fontSize: dp(context, 12),
//                               fontStyle: FontStyle.normal,
//                             ),
//                             CustomText(
//                               text: "Date : ${controller.billDate}",
//                               color: AppColors.DARK,
//                               fontSize: dp(context, 12),
//                               fontStyle: FontStyle.normal,
//                             ),
//                           ],
//                         ),

//                         SizedBox(height: hp(1)),

//                         /// PATIENT DETAILS
//                         /// visit history
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             /// PATIENT INFO
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomText(
//                                     text: "Patient : ${controller.patientName}",
//                                     color: AppColors.DARK,
//                                     fontSize: dp(context, 12),
//                                     fontStyle: FontStyle.normal,
//                                   ),
//                                   CustomText(
//                                     text:
//                                         "Mobile : ${controller.patientMobile}",
//                                     color: AppColors.DARK,
//                                     fontSize: dp(context, 12),
//                                     fontStyle: FontStyle.normal,
//                                   ),
//                                   CustomText(
//                                     text: "City : ${controller.patientCity}",
//                                     color: AppColors.DARK,
//                                     fontSize: dp(context, 12),
//                                     fontStyle: FontStyle.normal,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),

//                         const Divider(),
//                         /// visit history
//                           CustomText(
//                           text: "Observation : ${controller.}",
//                           color: AppColors.DARK,
//                           fontSize: dp(context, 12),
//                           fontStyle: FontStyle.normal,
//                         ),
//                         SizedBox(height: hp(0.5),),
//                         /// visit history
//                           CustomText(
//                           text: "Problem : ${controller.}",
//                           color: AppColors.DARK,
//                           fontSize: dp(context, 12),
//                           fontStyle: FontStyle.normal,
//                         ),
//                             SizedBox(height: hp(0.5),),
// /// visit history
//                             // ahi tu ak dropdown add karav and ama pdf list add karavi ap

//                         const Divider(),
// /// visit history
//                         /// TABLE HEADER
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: CustomText(
//                                 text: "No.",
//                                 color: AppColors.DARK,
//                                 fontSize: dp(context, 12),
//                                 fontStyle: FontStyle.normal,
//                               ),
//                             ),
//                             Expanded(
//                               flex: 4,
//                               child: CustomText(
//                                 text: "Medicine",
//                                 color: AppColors.DARK,
//                                 fontSize: dp(context, 12),
//                                 fontStyle: FontStyle.normal,
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: CustomText(
//                                 text: "Qty",
//                                 color: AppColors.DARK,
//                                 fontSize: dp(context, 12),
//                                 fontStyle: FontStyle.normal,
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: CustomText(
//                                 text: "Price",
//                                 color: AppColors.DARK,
//                                 fontSize: dp(context, 12),
//                                 fontStyle: FontStyle.normal,
//                               ),
//                             ),
//                           ],
//                         ),

//                         const Divider(),

//                         /// MEDICINE LIST
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: controller.medicineList.length,
//                           itemBuilder: (context, index) {
//                             final med = controller.medicineList[index];

//                             return Padding(
//                               padding: EdgeInsets.symmetric(vertical: hp(0.5)),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: CustomText(
//                                       text: "${index + 1}",
//                                       color: AppColors.DARK,
//                                       fontSize: dp(context, 12),
//                                       fontStyle: FontStyle.normal,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 4,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         CustomText(
//                                           text: med["name"],
//                                           color: AppColors.DARK,
//                                           fontSize: dp(context, 12),
//                                           fontStyle: FontStyle.normal,
//                                         ),
//                                         SizedBox(height: hp(0.5)),
//                                         CustomText(
//                                           text: med["use"],
//                                           color: AppColors.DARK,
//                                           fontSize: dp(context, 10),
//                                           fontStyle: FontStyle.normal,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 2,
//                                     child: CustomText(
//                                       text: med["qty"].toString(),
//                                       color: AppColors.DARK,
//                                       fontSize: dp(context, 12),
//                                       fontStyle: FontStyle.normal,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 2,
//                                     child: CustomText(
//                                       text: "₹${med["qty"] * med["price"]}",
//                                       color: AppColors.DARK,
//                                       fontSize: dp(context, 12),
//                                       fontStyle: FontStyle.normal,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),

//                         const Divider(),
// // billing ma
//                         /// TOTAL
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             CustomText(
//                               text: "Total : ₹${controller.totalAmount}",
//                               color: AppColors.DARK,
//                               fontSize: dp(context, 18),
//                               fontStyle: FontStyle.normal,
//                             ),
//                           ],
//                         ),

//                         SizedBox(height: hp(2)),

//                         /// QR CODE
//                         Center(
//                           child: CustomText(
//                             text: "Scan & Pay",
//                             color: AppColors.DARK,
//                             fontSize: dp(context, 14),
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),

//                         SizedBox(height: hp(0.5)),
// // billing ma
//                         Center(
//                           child: QrImageView(
//                             data: controller.upiUrl,
//                             size: dp(context, 100),
//                           ),
//                         ),
//                         SizedBox(height: hp(1)),
//                         Center(
//                           child: CustomText(
//                             text: "Thank You",
//                             color: AppColors.DARK,
//                             fontSize: dp(context, 14),
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: hp(1)),
//                   Customcontainer(
//                     context: context,
//                     text: "Back to Home",
//                     onTap: () {
//                       Get.offAllNamed(routedashboard);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
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
            lefticononTap: () {
              Get.back();
            },
            iconright: controller.isHistory ? null : Icons.share,
            righticononTap: () async {
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
                        /// DOCTOR DETAILS
                        if (!controller.isHistory)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Dr. ${controller.doctorName}",
                                fontSize: dp(context, 16),
                              ),
                              CustomText(
                                text: controller.doctorMobile,
                                fontSize: dp(context, 14),
                              ),
                            ],
                          ),

                        if (!controller.isHistory) SizedBox(height: hp(1)),

                        if (!controller.isHistory)
                          Center(
                            child: CustomText(
                              text: controller.clinicName,
                              fontSize: dp(context, 14),
                            ),
                          ),
                        if (!controller.isHistory)
                          Center(
                            child: CustomText(
                              text: controller.clinicAddress,
                              fontSize: dp(context, 14),
                            ),
                          ),

                        if (!controller.isHistory) SizedBox(height: hp(1)),
                        if (!controller.isHistory) const Divider(),

                        /// BILL DETAILS (only for billing mode)
                        if (!controller.isHistory)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Bill No : ${controller.billNo}",
                                fontSize: dp(context, 12),
                              ),
                              CustomText(
                                text: "Date : ${controller.billDate}",
                                fontSize: dp(context, 12),
                              ),
                            ],
                          ),

                        if (!controller.isHistory) SizedBox(height: hp(1)),

                        /// PATIENT DETAILS
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Patient : ${controller.patientName}",
                              fontSize: dp(context, 12),
                            ),
                            CustomText(
                              text: "Mobile : ${controller.patientMobile}",
                              fontSize: dp(context, 12),
                            ),
                            CustomText(
                              text: "City : ${controller.patientCity}",
                              fontSize: dp(context, 12),
                            ),
                          ],
                        ),

                        const Divider(),

                        /// 🔥 MAIN CONDITION

                        if (!controller.isHistory) ...[
                          /// ✅ BILL MODE

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

                              return Row(
                                children: [
                                  Expanded(child: Text("${index + 1}")),
                                  Expanded(flex: 3, child: Text(med["name"])),
                                  Expanded(child: Text(med["qty"].toString())),
                                  Expanded(
                                      child: Text(
                                          "₹${med["qty"] * med["price"]}")),
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
                        ] else ...[
                          /// ✅ HISTORY MODE

                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.visitList.length,
                            itemBuilder: (context, index) {
                              final visit = controller.visitList[index];
                              final medicines = visit.medicines ?? [];
                              return Card(
                                child: ListTile(
                                  title: Text(visit.date ?? ""),
                                  subtitle: Column(
                                    children: [
                                      Text(visit.problem ?? ""),
                                      SizedBox(
                                        height: hp(1),
                                      ),
                                      Text(visit.observation ?? ""),
                                      SizedBox(
                                        height: hp(1),
                                      ),

                                      /// TABLE HEADER
                                      const Row(
                                        children: [
                                          Expanded(child: Text("No.")),
                                          Expanded(
                                              flex: 3, child: Text("Medicine")),
                                          Expanded(child: Text("Qty")),
                                          Expanded(child: Text("Price")),
                                        ],
                                      ),

                                      const Divider(),

                                      /// MEDICINE LIST

                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: medicines.length,
                                        itemBuilder: (context, i) {
                                          final med = medicines[i];

                                          return Row(
                                            children: [
                                              Expanded(child: Text("${i + 1}")),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(med.toString())),
                                              const Expanded(child: Text("-")),
                                              const Expanded(child: Text("-")),
                                            ],
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: hp(1)),
                  Customcontainer(
                    context: context,
                    text: controller.isHistory ? "Done" : "Back to Home",
                    onTap: () {
                      if (!controller.isHistory) {
                        Get.offAllNamed(routedashboard);
                      } else {
                        Get.back();
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

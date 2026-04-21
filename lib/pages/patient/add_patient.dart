import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:shunya_app/dependency_injection.dart';
import 'package:shunya_app/pages/patient/patient_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';
import 'package:shunya_app/widgets/customcontainer.dart';
import '../../widgets/custom_dropdown.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PatientController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = Get.arguments;

      if (args != null) {
        controller.setPatientData(
          args["patientList"],
          args["index"],
        );
      } else {
        controller.clearForm(); // 🔥 important
      }
    });
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: CustomAppBarAction(
        title: Get.arguments != null ? "Patient" : "Add Patient",
        iconleft: Icons.arrow_back_ios_rounded,
        lefticononTap: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: wp(5),
              vertical: hp(2),
            ),
            child: Column(
              children: [
                // Name Field
                CustomTextField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: controller.nameController,
                  hint: "Patient Name",
                  labeltext: 'Patient Name',
                  validator: formValidation.validation(
                    type: 'name',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: "Patient Name is required.",
                  ),
                  prefixicon: Icon(
                    Icons.person_2_outlined,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),

                // gender
                CustomTextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: controller.mobileController,
                  hint: "Mobile Number",
                  labeltext: 'Mobile Number',
                  validator: formValidation.validation(
                    type: 'number',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: "Mobile Number is required.",
                  ),
                  prefixicon: Icon(
                    Icons.call,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: controller.villageController,
                  hint: "Village",
                  labeltext: 'Village',
                  validator: formValidation.validation(
                    type: 'name',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: "Village is required.",
                  ),
                  prefixicon: Icon(
                    Icons.home,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),
                CustomTextField(
                  controller: controller.addressController,
                  hint: "Address",
                  labeltext: "Address",
                  maxLines: 3,
                  prefixicon: Icon(
                    Icons.location_on_outlined,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),

                // DOB
                CustomTextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: controller.weightController,
                  hint: "Weight",
                  labeltext: 'Weight',
                  validator: formValidation.validation(
                    type: 'weight',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: "Weight is required.",
                  ),
                  prefixicon: Icon(
                    Icons.monitor_weight_outlined,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),

                // Age
                CustomTextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: controller.hightController,
                  hint: "Height In CM",
                  labeltext: 'Height In CM',
                  validator: formValidation.validation(
                    type: 'hight',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: "Height is required.",
                  ),
                  prefixicon: Icon(
                    Icons.height,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),

                // Blood group
                CustomTextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: controller.ageController,
                  hint: "Age",
                  labeltext: 'Age',
                  validator: formValidation.validation(
                    type: 'age',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: "Age is required.",
                  ),
                  prefixicon: Icon(
                    Icons.height,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),

                // Blood group
                CustomTextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: controller.bpcountController,
                  hint: "BP count",
                  labeltext: 'BP count',
                  validator: formValidation.validation(
                    type: 'bpcount',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: "BP count is required.",
                  ),
                  prefixicon: Icon(
                    Icons.graphic_eq_outlined,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                SizedBox(height: hp(2)),

                // Blood group
                CustomTextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: controller.sugerlavelController,
                  hint: "Suger lavel",
                  labeltext: 'Suger lavel',
                  validator: formValidation.validation(
                    type: 'suger',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: "Suger lavel is required.",
                  ),
                  prefixicon: Icon(
                    Icons.gradient_sharp,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),

                SizedBox(height: hp(2)),
                Row(
                  children: [
                    /// BLOOD GROUP
                    Flexible(
                      flex: 1,
                      child: Obx(
                        () => DropdownButtonFormField<String>(
                          value: controller.selectedBloodGroup.value.isEmpty
                              ? null
                              : controller.selectedBloodGroup.value,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                          dropdownColor: AppColors.WHITE,
                          style: TextStyle(
                            fontSize: dp(context, 11.6),
                            color: AppColors.DARK,
                          ),
                          decoration: InputDecoration(
                            labelText: "Blood Group",
                            focusColor: AppColors.PRIMARY_COLOR,
                            prefixIcon: Icon(
                              Icons.bloodtype_outlined,
                              color: AppColors.PRIMARY_COLOR,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: hp(2.8),
                              horizontal: wp(3),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.LIGHT_GREY,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.LIGHT_GREY,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.PRIMARY_COLOR,
                                width: 1.5,
                              ),
                            ),
                          ),
                          items: controller.bloodGroups.map((blood) {
                            return DropdownMenuItem(
                              value: blood,
                              child: Text(blood),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.changeBloodGroup(value!);
                          },
                        ),
                      ),
                    ),

                    SizedBox(width: wp(3)),

                    /// DATE OF BIRTH
                    Flexible(
                      flex: 2,
                      child: CustomTextField(
                        readOnly: true,
                        controller: controller.dobController,
                        hint: "Date of Birth",
                        labeltext: "Date of Birth",
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.pickDate(context: context);
                          },
                          child: Icon(
                            Icons.calendar_month_sharp,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                        ),
                        prefixicon: Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: hp(2)),

                Obx(
                  () => Row(
                    children: [
                      /// MALE
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: "Male",
                              // ignore: deprecated_member_use
                              groupValue: controller.selectedGender.value,
                              activeColor: AppColors.PRIMARY_COLOR,
                              // ignore: deprecated_member_use
                              onChanged: (value) {
                                controller.changeGender(value!);
                              },
                            ),
                            const Text("Male"),
                          ],
                        ),
                      ),

                      /// FEMALE
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: "Female",
                              // ignore: deprecated_member_use
                              groupValue: controller.selectedGender.value,
                              activeColor: AppColors.PRIMARY_COLOR,
                              // ignore: deprecated_member_use
                              onChanged: (value) {
                                controller.changeGender(value!);
                              },
                            ),
                            const Text("Female"),
                          ],
                        ),
                      ),

                      /// OTHER
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: "Other",
                              // ignore: deprecated_member_use
                              groupValue: controller.selectedGender.value,
                              activeColor: AppColors.PRIMARY_COLOR,
                              // ignore: deprecated_member_use
                              onChanged: (value) {
                                controller.changeGender(value!);
                              },
                            ),
                            const Text("Other"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: hp(2)),
                Obx(
                  () => Row(
                    children: [
                      /// MARRIED
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: "Married",
                              // ignore: deprecated_member_use
                              groupValue: controller.maritalStatus.value,
                              activeColor: AppColors.PRIMARY_COLOR,
                              // ignore: deprecated_member_use
                              onChanged: (value) {
                                controller.changeMaritalStatus(value!);
                              },
                            ),
                            const Text("Married"),
                          ],
                        ),
                      ),

                      /// UNMARRIED
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: "Unmarried",
                              // ignore: deprecated_member_use
                              groupValue: controller.maritalStatus.value,
                              activeColor: AppColors.PRIMARY_COLOR,
                              // ignore: deprecated_member_use
                              onChanged: (value) {
                                controller.changeMaritalStatus(value!);
                              },
                            ),
                            const Text("Unmarried"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (Get.arguments != null)
                  SizedBox(height: hp(2))
                else
                  const SizedBox(),
                if (Get.arguments != null)
                  Customcontainer(
                      context: context,
                      text: "Visit History",
                      color: AppColors.WHITE,
                      textcolor: AppColors.PRIMARY_COLOR,
                      bordercolor: AppColors.LIGHT_GREY,
                      onTap: () {
                        final args = Get.arguments;
                        final patient = args["patientList"];

                        controller.loadVisits(patient.id);

                        Get.toNamed(
                          routebillingdetailspage,
                          arguments: {
                            "patient": patient,
                            "visits": controller.visitList,
                            "isHistory": true,
                          },
                        );
                      })
                else
                  const SizedBox(),
                if (Get.arguments != null)
                  SizedBox(height: hp(2))
                else
                  const SizedBox(),

                if (Get.arguments != null)
                  CustomTextField(
                    controller: controller.patientproblemController,
                    hint: "Patient Problem",
                    labeltext: "Patient Problem",
                    maxLines: 3,
                    prefixicon: Icon(
                      Icons.report_problem_rounded,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                  )
                else
                  const SizedBox(),
                if (Get.arguments != null)
                  SizedBox(height: hp(2))
                else
                  const SizedBox(),
                if (Get.arguments != null)
                  CustomTextField(
                    controller: controller.patientobservationlavelController,
                    hint: "Patient Observation",
                    labeltext: "Patient Observation",
                    maxLines: 3,
                    prefixicon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                  )
                else
                  const SizedBox(),
                if (Get.arguments != null)
                  SizedBox(height: hp(2))
                else
                  const SizedBox(),

                if (Get.arguments != null)
                  CustomDropdown(
                    labelText: "Disease",
                    items: controller.diseaselist
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    iconprefix: Icons.medication,
                    onChanged: (value) {
                      controller.addDisease(value!);
                    },
                  )
                else
                  const SizedBox(),
                if (Get.arguments != null)
                  SizedBox(height: hp(2))
                else
                  const SizedBox(),

                /// image upload and save in pdf formate
                ///
                /// 📄 MULTIPLE PDF UPLOAD
                if (Get.arguments != null)
                  Customcontainer(
                    context: context,
                    text: "Upload PDFs (Multiple)",
                    color: AppColors.WHITE,
                    textcolor: AppColors.PRIMARY_COLOR,
                    bordercolor: AppColors.LIGHT_GREY,
                    onTap: controller.pickMultiplePdf,
                  )
                else
                  const SizedBox(),

                if (Get.arguments != null)
                  SizedBox(height: hp(2))
                else
                  const SizedBox(),

                /// 📸 MULTI IMAGE PICK
                if (Get.arguments != null)
                  Customcontainer(
                    context: context,
                    text: "Upload Images (Create PDF)",
                    color: AppColors.WHITE,
                    textcolor: AppColors.PRIMARY_COLOR,
                    bordercolor: AppColors.LIGHT_GREY,
                    onTap: controller.pickMultipleImages,
                  )
                else
                  const SizedBox(),

                if (Get.arguments != null)
                  Obx(() {
                    if (controller.generatedPdf.value != null) {
                      return const Text(
                        "PDF Ready ✅",
                        style: TextStyle(color: Colors.green),
                      );
                    }
                    return const SizedBox();
                  })
                else
                  const SizedBox(),

                SizedBox(height: hp(2)),

                /// 📄 PDF LIST
                ///
                if (Get.arguments != null)
                  Obx(() {
                    if (controller.pdfList.isEmpty) return const SizedBox();

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.pdfList.length,
                      itemBuilder: (context, index) {
                        final file = controller.pdfList[index];

                        return GestureDetector(
                          onTap: () {
                            controller.openPdf(file);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: hp(1)),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.LIGHT_GREY,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.red,
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Text(
                                    file.path.split('/').last,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                /// ❌ REMOVE BUTTON
                                IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    controller.removePdf(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  })
                else
                  const SizedBox(),

                /// 📄 GENERATED PDF STATUS
                if (Get.arguments != null)
                  SizedBox(height: hp(2))
                else
                  const SizedBox(),
                if (Get.arguments != null)
                  Customcontainer(
                      context: context,
                      text: "Select Medicine",
                      color: AppColors.WHITE,
                      textcolor: AppColors.PRIMARY_COLOR,
                      bordercolor: AppColors.LIGHT_GREY,
                      onTap: () async {
                        final result =
                            await Get.toNamed(routeselectmedicinepage);

                        if (result != null) {
                          controller.medicineList
                              .assignAll(result); // 🔥 MAIN FIX
                        }
                      })
                else
                  const SizedBox(),

                SizedBox(height: hp(3)),

                //  Button
                Customcontainer(
                  text:
                      Get.arguments != null ? "Save & Next" : "Create Patient",
                  context: context,
                  onTap: () async {
                    if (controller.isEditMode.value) {
                      final args = Get.arguments;
                      final patient = args["patientList"]; // 🔥 correct patient

                      final visit = await controller.addVisit(patient);

                      Get.toNamed(
                        routebillingdetailspage,
                        arguments: {
                          "patient": patient,
                          "visit": visit,
                          "medicines": controller.medicineList,
                          "isHistory": false,
                        },
                      );
                    } else {
                      controller.savePatient();
                    }
                  },
                ),
                SizedBox(height: hp(3)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void showDialoghistory({
//   required BuildContext context,
//   required PatientModel patient,
// }) {
//   final controller = Get.find<PatientController>();
//   showDialog(
//     context: context,
//     builder: (_) {
//       return AlertDialog(
//         backgroundColor: AppColors.WHITE,
//         titleTextStyle: TextStyle(
//           color: Colors.red,
//           fontSize: dp(context, 24),
//           fontStyle: FontStyle.italic,
//         ),
//         title: CustomText(
//           text: patient.name,
//         ),
//         /// 🔥 FIXED (SizedBox added)
//         content: SizedBox(
//           width: double.maxFinite,
//           height: 400,
//           child: ListView.builder(
//             padding: EdgeInsets.all(wp(0.2)),
//             itemCount: controller.visitList.length,
//             itemBuilder: (context, index) {
//               final visit = controller.visitList[index];
//               return Container(
//                 margin: EdgeInsets.only(bottom: hp(1)),
//                 decoration: BoxDecoration(
//                   color: AppColors.WHITE,
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: AppColors.LIGHT_GREY),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.LIGHT_GREY.withOpacity(0.1),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   /// 📅 DATE
//                   title: CustomText(
//                     text: visit.date,
//                     color: AppColors.PRIMARY_COLOR,
//                     fontSize: dp(context, 16),
//                   ),
//                   /// DETAILS
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: hp(0.5)),
//                       /// 🧾 PROBLEM
//                       CustomText(
//                         text: visit.problem,
//                         color: AppColors.DARK,
//                         fontSize: dp(context, 13),
//                       ),
//                       SizedBox(height: hp(0.5)),
//                       /// 🔍 OBSERVATION
//                       CustomText(
//                         text: visit.observation,
//                         color: AppColors.DARK,
//                         fontSize: dp(context, 12),
//                       ),
//                       SizedBox(height: hp(1)),
//                       /// 💊 MEDICINE TABLE
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: AppColors.PRIMARY_COLOR),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Column(
//                             children: [
//                               /// HEADER
//                               Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10),
//                                 color: AppColors.PRIMARY_COLOR,
//                                 child: const Row(
//                                   children: [
//                                     SizedBox(
//                                         width: 100,
//                                         child: Center(
//                                             child: Text("Name",
//                                                 style: TextStyle(
//                                                     color: Colors.white)))),
//                                     SizedBox(
//                                         width: 120,
//                                         child: Center(
//                                             child: Text("Quantity",
//                                                 style: TextStyle(
//                                                     color: Colors.white)))),
//                                     SizedBox(
//                                         width: 100,
//                                         child: Center(
//                                             child: Text("Use",
//                                                 style: TextStyle(
//                                                     color: Colors.white)))),
//                                   ],
//                                 ),
//                               ),
//                               /// LIST
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width * 1.2,
//                                 child: ListView.builder(
//                                   shrinkWrap: true,
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   /// ✅ FIXED
//                                   itemCount: visit.medicines.length,
//                                   itemBuilder: (context, i) {
//                                     final m = visit.medicines[i];
//                                     return Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: hp(1)),
//                                       child: Row(
//                                         children: [
//                                           /// NAME
//                                           SizedBox(
//                                             width: wp(25),
//                                             child: CustomText(
//                                               text: m.toString(),
//                                               fontSize: dp(context, 10),
//                                             ),
//                                           ),
//                                           /// QTY (temporary)
//                                           SizedBox(
//                                             width: wp(30),
//                                             child: Center(
//                                               child: CustomText(
//                                                 text: "-",
//                                                 fontSize: dp(context, 10),
//                                               ),
//                                             ),
//                                           ),
//                                           /// USE (temporary)
//                                           SizedBox(
//                                             width: wp(25),
//                                             child: Center(
//                                               child: CustomText(
//                                                 text: "-",
//                                                 fontSize: dp(context, 10),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         contentTextStyle: TextStyle(
//           fontSize: dp(context, 15),
//           color: AppColors.DARK,
//         ),
//       );
//     },
//   );
// }

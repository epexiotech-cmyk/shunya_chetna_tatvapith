import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shunya_app/dependency_injection.dart';
import 'package:shunya_app/pages/patient/patient_controller.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientController>(
      init: PatientController(),
      builder: (controller) {
        final args = Get.arguments;
        // print("args ;;;; $args");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (args != null && controller.isEditMode.value == false) {
            final patient = args["patientList"];
            final index = args["index"];

            controller.setPatientData(patient, index);
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
                                fontSize: dp(context, 14),
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
                                  vertical: hp(2),
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
                          flex: 1,
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
                      CustomTextField(
                        controller:
                            controller.patientobservationlavelController,
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
                        onTap: () {
                          Get.toNamed(routeselectmedicinepage);
                        },
                      )
                    else
                      const SizedBox(),

                    SizedBox(height: hp(3)),

                    // Login Button
                    Customcontainer(
                        text: Get.arguments != null
                            ? "Save & Next"
                            : "Create Patient",
                        context: context,
                        onTap: () {
                          if (Get.arguments != null) {
                            controller.savePatient(); // ✅ FIXED
                            Get.toNamed(routebillingdetailspage);
                          } else {
                            controller.savePatient(); // ✅ FIXED
                          }
                        }),
                    SizedBox(height: hp(3)),
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

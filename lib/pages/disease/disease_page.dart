import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/disease/disease_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class DiseasePage extends StatelessWidget {
  const DiseasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiseaseController()); //✅ FIXED

    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Padding(
        padding: EdgeInsets.only(top: hp(2), left: wp(5), right: wp(5)),

        /// ONLY OBX (NO GETBUILDER)
        child: Obx(() {
          if (controller.diseaseList.isEmpty) {
            return Center(
              child: CustomText(
                text: "No Disease Added",
                color: AppColors.DARK,
                fontSize: dp(context, 14),
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.diseaseList.length,
            itemBuilder: (context, index) {
              final disease = controller.diseaseList[index];

              return Container(
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
                  title: CustomText(
                    text: disease["name"] ?? "",
                    color: AppColors.PRIMARY_COLOR,
                    fontSize: dp(context, 16),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      controller.deleteDisease(index);
                    },
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

void showDialogDisease({required BuildContext context}) {
  DiseaseController controller = DiseaseController();
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: AppColors.WHITE,
        titleTextStyle: TextStyle(
          color: Colors.red,
          fontSize: dp(context, 24),
          fontStyle: FontStyle.italic,
        ),
        title: CustomText(text: "Add Disease"),
        content: CustomTextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          controller: controller.adddiseasecontroller,
          hint: "Disease",
          labeltext: 'Disease',
          suffixIcon: Icon(Icons.ac_unit_sharp, color: AppColors.PRIMARY_COLOR),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// YES BUTTON
              Customcontainer(
                onTap: () {
                  controller.addDisease();
                },
                context: context,
                width: wp(32),
                text: "Add",
                textcolor: AppColors.WHITE,
                color: AppColors.PRIMARY_COLOR,
              ),

              SizedBox(width: wp(2)),

              /// NO BUTTON
              Customcontainer(
                onTap: () {
                  Get.back();
                },
                width: wp(32),
                context: context,
                text: "No",
                textcolor: AppColors.WHITE,
                color: AppColors.DARK,
              ),
            ],
          ),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/select_medicine/select_medicine_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_dropdown.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class SelectMedicineScreen extends StatelessWidget {
  const SelectMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectMedicineController());

    return Obx(() => Scaffold(
          backgroundColor: AppColors.WHITE,
          appBar: CustomAppBarAction(
            title: "Select Medicine",
            iconleft: Icons.arrow_back_ios_rounded,
            lefticononTap: () => Get.back(),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),
              child: Column(
                children: [
                  /// ARC + TABLET
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Arc",
                          items: controller.arclist
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          iconprefix: Icons.medication,
                          onChanged: (value) {
                            controller.addMedicine(value!);
                          },
                        ),
                      ),
                      SizedBox(width: wp(3)),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Tablet",
                          items: controller.tabletlist
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          iconprefix: Icons.medication,
                          onChanged: (value) {
                            controller.addMedicine(value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: hp(2)),

                  /// OIL + DROP
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Oil",
                          items: controller.oillist
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          iconprefix: Icons.medication,
                          onChanged: (value) {
                            controller.addMedicine(value!);
                          },
                        ),
                      ),
                      SizedBox(width: wp(3)),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Drop",
                          items: controller.droplist
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          iconprefix: Icons.medication,
                          onChanged: (value) {
                            controller.addMedicine(value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: hp(2)),

                  /// NASYA + POWER
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Nasya",
                          items: controller.nasyalist
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          iconprefix: Icons.medication,
                          onChanged: (value) {
                            controller.addMedicine(value!);
                          },
                        ),
                      ),
                      SizedBox(width: wp(3)),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Power",
                          items: controller.powerlist
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          iconprefix: Icons.medication,
                          onChanged: (value) {
                            controller.addMedicine(value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: hp(3)),

                  /// TABLE
                  controller.medicineList.isEmpty
                      ? const SizedBox()
                      : Obx(
                          () => SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.PRIMARY_COLOR),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                children: [
                                  /// HEADER (FIXED)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    color: AppColors.PRIMARY_COLOR,
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                            width: 100,
                                            child: Center(
                                                child: Text("Name",
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        SizedBox(
                                            width: 120,
                                            child: Center(
                                                child: Text("Quantity",
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        SizedBox(
                                            width: 100,
                                            child: Center(
                                                child: Text("Use",
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        SizedBox(
                                            width: 100,
                                            child: Center(
                                                child: Text("Price",
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        SizedBox(width: 60),
                                      ],
                                    ),
                                  ),

                                  /// LIST
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 1.2,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller.medicineList.length,
                                      itemBuilder: (context, index) {
                                        final m =
                                            controller.medicineList[index];

                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: hp(1)),
                                          child: Row(
                                            children: [
                                              /// NAME
                                              SizedBox(
                                                width: wp(25),
                                                child: CustomText(
                                                  text: m["name"],
                                                  fontSize: dp(context, 10),
                                                ),
                                              ),

                                              /// QTY
                                              SizedBox(
                                                width: wp(30),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons.remove,
                                                          size:
                                                              dp(context, 10)),
                                                      onPressed: () =>
                                                          controller
                                                              .decreaseQty(
                                                                  index),
                                                    ),
                                                    CustomText(
                                                      text: "${m["qty"]}",
                                                      fontSize: dp(context, 10),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.add,
                                                          size:
                                                              dp(context, 10)),
                                                      onPressed: () =>
                                                          controller
                                                              .increaseQty(
                                                                  index),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              /// USE
                                              SizedBox(
                                                width: wp(25),
                                                child: Center(
                                                  child: CustomText(
                                                    text:
                                                        m["use"]?.toString() ??
                                                            "-",
                                                    fontSize: dp(context, 10),
                                                  ),
                                                ),
                                              ),

                                              /// PRICE (FIXED)
                                              SizedBox(
                                                width: wp(30),
                                                child: Center(
                                                  child: CustomText(
                                                    text: "₹ ${m["price"]}",
                                                    fontSize: dp(context, 10),
                                                  ),
                                                ),
                                              ),

                                              /// DELETE
                                              SizedBox(
                                                width: wp(5),
                                                child: IconButton(
                                                  icon: const Icon(Icons.delete,
                                                      color: Colors.red),
                                                  onPressed: () => controller
                                                      .removeMedicine(index),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                  SizedBox(height: hp(3)),

                  /// SAVE
                  controller.medicineList.isEmpty
                      ? const SizedBox()
                      : Customcontainer(
                          context: context,
                          text: "Save",
                          onTap: () {
                            Get.back(
                                closeOverlays: false,
                                result: controller.medicineList);
                          },
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}

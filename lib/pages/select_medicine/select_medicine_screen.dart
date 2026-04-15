import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/select_medicine/select_medicine_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_dropdown.dart';
import 'package:shunya_app/widgets/customcontainer.dart';

class SelectMedicineScreen extends StatelessWidget {
  const SelectMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectMedicineController>(
      init: SelectMedicineController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          appBar: CustomAppBarAction(
            title: "Select Medicine",
            iconleft: Icons.arrow_back_ios_rounded,
            lefticononTap: () {
              Get.back();
            },
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
                          items: controller.arclist.map((arc) {
                            return DropdownMenuItem(
                              value: arc,
                              child: Text(arc),
                            );
                          }).toList(),
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
                          items: controller.tabletlist.map((tablet) {
                            return DropdownMenuItem(
                              value: tablet,
                              child: Text(tablet),
                            );
                          }).toList(),
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
                          items: controller.oillist.map((oil) {
                            return DropdownMenuItem(
                              value: oil,
                              child: Text(oil),
                            );
                          }).toList(),
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
                          items: controller.droplist.map((drop) {
                            return DropdownMenuItem(
                              value: drop,
                              child: Text(drop),
                            );
                          }).toList(),
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
                          items: controller.nasyalist.map((nasya) {
                            return DropdownMenuItem(
                              value: nasya,
                              child: Text(nasya),
                            );
                          }).toList(),
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
                          items: controller.powerlist.map((power) {
                            return DropdownMenuItem(
                              value: power,
                              child: Text(power),
                            );
                          }).toList(),
                          iconprefix: Icons.medication,
                          onChanged: (value) {
                            controller.addMedicine(value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: hp(3)),

                  /// MEDICINE TABLE
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.PRIMARY_COLOR),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        /// HEADER
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          color: AppColors.PRIMARY_COLOR,
                          child: const Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "Name",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "Use",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "Price",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(flex: 1, child: SizedBox()),
                            ],
                          ),
                        ),

                        /// ROWS
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.medicineList.length,
                          itemBuilder: (context, index) {
                            final medicine = controller.medicineList[index];

                            return Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 6,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: AppColors.PRIMARY_COLOR,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  /// NAME
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(medicine["name"]),
                                    ),
                                  ),

                                  /// QUANTITY
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.decreaseQty(index);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                            ),
                                            child: const Icon(
                                              Icons.remove,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text("${medicine["qty"]}"),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            controller.increaseQty(index);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// USE
                                  Expanded(
                                    flex: 2,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: medicine["use"],
                                        isExpanded: true,
                                        items: controller.useList.map((use) {
                                          return DropdownMenuItem(
                                            value: use,
                                            child: Center(child: Text(use)),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          controller.updateUse(index, value!);
                                        },
                                      ),
                                    ),
                                  ),

                                  /// PRICE
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                          hintText: "₹",
                                          isDense: true,
                                          border: OutlineInputBorder(),
                                        ),
                                        onChanged: (value) {
                                          controller.updatePrice(index, value);
                                        },
                                      ),
                                    ),
                                  ),

                                  /// DELETE
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        controller.removeMedicine(index);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: hp(3)),
                  controller.medicineList.isEmpty
                      ? const SizedBox()
                      : Customcontainer(
                          context: context,
                          text: "Save",
                          onTap: () {
                            Get.back(result: controller.medicineList);
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

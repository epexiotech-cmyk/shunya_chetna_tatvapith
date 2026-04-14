import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_dropdown.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';
import 'package:shunya_app/widgets/customcontainer.dart';
import 'inventory_controller.dart';

class AddInventoryPage extends StatelessWidget {
  const AddInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(
      init: InventoryController(),
      builder: (controller) {
        final args = Get.arguments;

        if (args != null && args["isEdit"] == true) {
          controller.setEditData(args["data"], args["index"]);
        }
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          appBar: CustomAppBarAction(
            title: controller.isEditMode.value
                ? "Update Inventory"
                : "Add Inventory",
            iconleft: Icons.arrow_back_ios_rounded,
            lefticononTap: () {
              Get.back();
            },
            iconright: Icons.add,
            righticononTap: () {
              controller.addRow(); // 🔥 IMPORTANT ()
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// INVENTORY LIST
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.inventoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(bottom: hp(1)),
                            child: Container(
                              margin: EdgeInsets.only(bottom: hp(1)),
                              decoration: BoxDecoration(
                                color: AppColors.WHITE,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.LIGHT_GREY),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.LIGHT_GREY.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0,
                                        3), // changes position of shadow (right, down)
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller:
                                      controller.inventoryList[index].name,
                                  hint: "Medicine Name",
                                  labeltext: 'Medicine Name',
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: hp(1),
                                    ),

                                    /// NASYA + POWER
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Obx(() {
                                            final item =
                                                controller.inventoryList[index];

                                            return CustomDropdown(
                                              labelText: "Type",
                                              initialValue: item.type.value,
                                              items: controller.typelist
                                                  .map((type) {
                                                return DropdownMenuItem(
                                                  value: type,
                                                  child: Text(type),
                                                );
                                              }).toList(),
                                              iconprefix: Icons.medication,
                                              onChanged: (value) {
                                                item.type.value = value!;
                                              },
                                            );
                                          }),
                                        ),
                                        SizedBox(width: wp(3)),
                                        Expanded(
                                          child: Obx(() {
                                            final item =
                                                controller.inventoryList[index];

                                            List<String> useList;

                                            switch (item.type.value) {
                                              case "ARK":
                                                useList = controller.uselist;
                                                break;
                                              case "OIL":
                                                useList = controller.useoillist;
                                                break;
                                              case "Nasya":
                                                useList =
                                                    controller.useNasaylist;
                                                break;
                                              case "Power":
                                                useList =
                                                    controller.usepowerlist;
                                                break;
                                              case "Tablet":
                                                useList =
                                                    controller.useTabletlist;
                                                break;
                                              case "Drop":
                                                useList =
                                                    controller.useDroplist;
                                                break;
                                              default:
                                                useList = [];
                                            }

                                            /// 🔥 FIX: VALIDATE VALUE
                                            String? safeValue =
                                                useList.contains(item.use.value)
                                                    ? item.use.value
                                                    : null;

                                            return CustomDropdown(
                                              labelText: "Use",
                                              initialValue: safeValue,
                                              items: useList.map((use) {
                                                return DropdownMenuItem(
                                                  value: use,
                                                  child: Text(use),
                                                );
                                              }).toList(),
                                              iconprefix: Icons.medication,
                                              onChanged: (value) {
                                                item.use.value = value!;
                                              },
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: hp(1),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: controller
                                                .inventoryList[index].qty,
                                            hint: "Quantity",
                                            labeltext: 'Quantity',
                                          ),
                                        ),
                                        SizedBox(
                                          width: wp(3),
                                        ),
                                        Expanded(
                                          child: CustomTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: controller
                                                .inventoryList[index].price,
                                            hint: "Price",
                                            labeltext: 'Price',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                Customcontainer(
                  context: context,
                  text: controller.isEditMode.value
                      ? "Update Inventory"
                      : "Save Inventory",
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(height: hp(4)),
              ],
            ),
          ),
        );
      },
    );
  }
}

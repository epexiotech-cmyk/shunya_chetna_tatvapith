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
    /// 🔥 ONLY THIS (SINGLE CONTROLLER)
    final controller = Get.find<InventoryController>();

    final args = Get.arguments;

    /// 🔥 EDIT MODE SAFE LOAD
    if (args != null &&
        args["isEdit"] == true &&
        !controller.isEditMode.value) {
      controller.setEditData(args["data"], args["index"]);
    }

    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: CustomAppBarAction(
        title:
            controller.isEditMode.value ? "Update Inventory" : "Add Inventory",
        iconleft: Icons.arrow_back_ios_rounded,
        lefticononTap: () {
          controller.resetForm();
          Get.back();
        },
        iconright: Icons.add,
        righticononTap: () {
          controller.addRow();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.inventoryList.length,
                  itemBuilder: (context, index) {
                    final item = controller.inventoryList[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: hp(1)),
                      padding: EdgeInsets.all(wp(2)),
                      decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.LIGHT_GREY),
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: item.name,
                            hint: "Medicine Name",
                            labeltext: "Medicine Name",
                          ),
                          SizedBox(height: hp(1)),
                          Row(
                            children: [
                              Expanded(
                                child: Obx(() => CustomDropdown(
                                      labelText: "Type",
                                      initialValue: item.type.value,
                                      items: controller.typelist
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        item.type.value = val!;
                                        item.use.value = "";
                                      },
                                    )),
                              ),
                              SizedBox(width: wp(3)),
                              Expanded(
                                child: Obx(() {
                                  List<String> useList =
                                      controller.getUseList(item.type.value);

                                  String? safeValue =
                                      useList.contains(item.use.value)
                                          ? item.use.value
                                          : null;

                                  return CustomDropdown(
                                    labelText: "Use",
                                    initialValue: safeValue,
                                    items: useList
                                        .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ))
                                        .toList(),
                                    onChanged: (val) {
                                      item.use.value = val!;
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(height: hp(1)),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: item.qty,
                                  hint: "Quantity",
                                  labeltext: "Quantity",
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: wp(3)),
                              Expanded(
                                child: CustomTextField(
                                  controller: item.price,
                                  hint: "Price",
                                  labeltext: "Price",
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
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
                controller.saveOrUpdateInventory();
              },
            ),
            SizedBox(height: hp(3)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_appbar.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/customcontainer.dart';
import 'inventory_controller.dart';

class AddInventoryPage extends StatelessWidget {
  const AddInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(
      init: InventoryController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          appBar: CustomAppBarAction(
            title: "Add Inventory",
            iconleft: Icons.arrow_back_ios_rounded,
            lefticononTap: () {
              Get.back();
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TABLE HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomText(
                        text: "Medicine",
                        fontSize: dp(context, 16),
                        color: AppColors.PRIMARY_COLOR,
                        fontStyle: FontStyle.normal,
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Center(
                        child: CustomText(
                          text: "Quantity",
                          fontSize: dp(context, 15),
                          color: AppColors.PRIMARY_COLOR,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Center(
                        child: CustomText(
                          text: "Price",
                          fontSize: dp(context, 15),
                          color: AppColors.PRIMARY_COLOR,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 0,
                      child: Customcontainer(
                        margin: EdgeInsets.only(top: hp(0), bottom: hp(0)),
                        context: context,
                        text: "Add\nMore",
                        singlefontSize: dp(context, 8),
                        onTap: controller.addRow,
                      ),
                    ),
                  ],
                ),
                Divider(),

                /// INVENTORY LIST
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.inventoryList.length,

                      itemBuilder: (context, index) {
                        var item = controller.inventoryList[index];

                        return Padding(
                          padding: EdgeInsets.only(bottom: hp(1)),

                          child: Row(
                            children: [
                              /// MEDICINE NAME
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: item["name"],
                                  decoration: const InputDecoration(
                                    hintText: "Medicine Name",
                                  ),
                                ),
                              ),

                              SizedBox(width: wp(2)),

                              /// QUANTITY
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: item["qty"],
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "Qty",
                                  ),
                                ),
                              ),

                              SizedBox(width: wp(2)),

                              /// PRICE
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: item["price"],
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "Price",
                                  ),
                                ),
                              ),

                              /// DELETE BUTTON
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  controller.removeRow(index);
                                },
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
                  text: "Save Inventory",
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

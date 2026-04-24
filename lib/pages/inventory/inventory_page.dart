import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/pages/inventory/add_inventory.dart';
import 'package:shunya_app/pages/inventory/inventory_controller.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';
import 'package:shunya_app/widgets/custom_text.dart';
import 'package:shunya_app/widgets/custom_textfield.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(
      init: InventoryController()..loadInventory(), // 🔥 IMPORTANT
      builder: (controller) {
        final controller = Get.put(InventoryController());
        if (controller.inventoryList.isEmpty &&
            controller.isEditMode.value == false) {
          controller.addRow();
        }
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          body: Padding(
            padding: EdgeInsets.only(top: hp(2), left: wp(5), right: wp(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔍 SEARCH
                CustomTextField(
                  controller: controller.searchController,
                  hint: "Search Medicine",
                  labeltext: 'Search Medicine',
                  suffixIcon:
                      Icon(Icons.search, color: AppColors.PRIMARY_COLOR),

                  /// 🔥 FIX SEARCH
                  onchange: (value) {
                    controller.searchText.value = value;
                  },
                ),

                SizedBox(height: hp(2)),

                /// 📦 STOCK LIST
                Expanded(
                  child: Obx(() {
                    final list = controller.filteredStock;

                    if (list.isEmpty) {
                      return const Center(
                        child: Text("No Inventory Found"),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.all(wp(0.2)),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        var item = list[index];

                        bool lowStock = item["qty"] <= 10;

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
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: CustomText(
                              text: item["name"] ?? "",
                              color: AppColors.PRIMARY_COLOR,
                              fontSize: dp(context, 24),
                            ),

                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Price ₹${item["price"]}",
                                  color: AppColors.DARK,
                                  fontSize: dp(context, 20),
                                ),
                                CustomText(
                                  text: "Qty: ${item["qty"]}",
                                  color: lowStock ? Colors.red : Colors.green,
                                  fontSize: dp(context, 12),
                                ),
                                if (lowStock)
                                  const Text(
                                    "Low Stock",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                              ],
                            ),

                            /// ✏️ EDIT
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final result = await Get.to(
                                      () => const AddInventoryPage(),
                                      arguments: {
                                        "isEdit": true,
                                        "data": item,
                                        "index": index,
                                      },
                                    );

                                    /// 🔥 THIS IS THE FIX
                                    if (result == true) {
                                      controller.loadInventory();
                                    }
                                  },
                                  child: Icon(Icons.edit,
                                      color: AppColors.PRIMARY_COLOR),
                                ),
                                SizedBox(
                                  height: hp(0.8),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.deleteInventory(item["id"]);
                                  },
                                  child: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';

class CustomDropdown extends StatelessWidget {
  final String? initialValue;
  final String? labelText;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final IconData? iconprefix;
  const CustomDropdown({
    super.key,
    this.initialValue,
    this.labelText,
    this.items,
    this.onChanged,
    this.iconprefix,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: initialValue,

      icon: Icon(Icons.keyboard_arrow_down, color: AppColors.PRIMARY_COLOR),

      dropdownColor: AppColors.WHITE,

      style: TextStyle(fontSize: dp(context, 14), color: AppColors.DARK),

      decoration: InputDecoration(
        labelText: labelText,

        focusColor: AppColors.PRIMARY_COLOR,
        labelStyle: TextStyle(color: AppColors.PRIMARY_COLOR),

        prefixIcon: Icon(iconprefix, color: AppColors.PRIMARY_COLOR),

        contentPadding: EdgeInsets.symmetric(
          vertical: hp(2),
          horizontal: wp(3),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.LIGHT_GREY, width: 1),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.LIGHT_GREY, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.PRIMARY_COLOR, width: 1.5),
        ),
      ),

      items: items,

      onChanged: onChanged,
    );
  }
}

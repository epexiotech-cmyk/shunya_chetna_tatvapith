import 'package:flutter/material.dart';
import 'package:shunya_app/utils/colors.dart';
import 'package:shunya_app/utils/responsive.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;

  const CustomText({super.key, this.text, this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        fontSize: fontSize ?? dp(context, 20),
        color: color ?? AppColors.PRIMARY_COLOR,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

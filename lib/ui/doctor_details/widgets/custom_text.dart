import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyTextStyle.sfProRegular.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: MyColors.neutralBlack,
      ),
    );
  }
}

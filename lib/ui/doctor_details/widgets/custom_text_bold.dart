import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextBold extends StatelessWidget {
  const CustomTextBold({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      tr('doctor_details_screen.$text'),
      style: MyTextStyle.sfProMedium.copyWith(
        color: color,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.isActive,
    required this.buttonText,
    required this.onTap,
    this.isSmall = false,
  }) : super(key: key);
  final bool isActive;
  final String buttonText;
  final VoidCallback onTap;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: isSmall ? 43.h : 55.h,
      decoration: BoxDecoration(
        color: isActive ? null : MyColors.actionPrimaryDisabled,
        gradient: isActive
            ? const LinearGradient(colors: MyColors.otherGradient1)
            : null,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primary,
          // shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Text(
          tr('global.$buttonText'),
          style: MyTextStyle.sfProSemiBold.copyWith(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

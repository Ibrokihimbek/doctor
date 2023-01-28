import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipTextButtonOutline extends StatelessWidget {

  const ChipTextButtonOutline(
      {super.key,
      required this.buttonText,
      required this.onTap,
      required this.pageIndex, required this.isActive});
  final String buttonText;
  final VoidCallback onTap;
  final int pageIndex;
  final bool isActive;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 43.h,
        width: 180.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.actionPrimaryDefault,
            width: 2.w,
          ),
          color: pageIndex == 0
              ? MyColors.actionPrimaryDefault
              : MyColors.actionPrimaryInverted,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: MyTextStyle.sfProSemiBold.copyWith(
                fontSize: 18.sp,
                color: pageIndex == 0
                    ? MyColors.actionPrimaryInverted
                    : MyColors.actionPrimaryDefault),
          ),
        ),
      ),
    );
  }
}
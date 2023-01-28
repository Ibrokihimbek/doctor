import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class ChipIconButtonOutline extends StatelessWidget {
  const ChipIconButtonOutline({
    Key? key,
    required this.isActive,
    required this.buttonText,
    required this.onTap,
    required this.iconPath,
    this.iconIsRight = false,
  }) : super(key: key);
  final bool isActive;
  final String buttonText;
  final String iconPath;
  final VoidCallback onTap;
  final bool iconIsRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive
              ? MyColors.actionPrimaryDefault
              : MyColors.actionPrimaryDisabled,
          width: 1,
        ),
        color: MyColors.white,
        borderRadius: BorderRadius.circular(24.sp),
      ),
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.sp)),
        ),
        child: iconIsRight
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonText,
                    style: MyTextStyle.sfProSemiBold.copyWith(
                      fontSize: 18.sp,
                      color: isActive
                          ? MyColors.actionPrimaryDefault
                          : MyColors.actionPrimaryDisabled,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    iconPath,
                    color: isActive
                        ? MyColors.actionPrimaryDefault
                        : MyColors.actionPrimaryDisabled,
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    color: isActive
                        ? MyColors.actionPrimaryDefault
                        : MyColors.actionPrimaryDisabled,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    buttonText,
                    style: MyTextStyle.sfProSemiBold.copyWith(
                      fontSize: 18.sp,
                      color: isActive
                          ? MyColors.actionPrimaryDefault
                          : MyColors.actionPrimaryDisabled,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

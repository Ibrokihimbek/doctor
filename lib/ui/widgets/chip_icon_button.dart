import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ChipIconButton extends StatelessWidget {
  const ChipIconButton({
    Key? key,
    required this.isActive,
    required this.buttonText,
    required this.onTap,
    required this.iconPath,
    this.iconIsRight = false,
    this.isSmall = false,
  }) : super(key: key);
  final bool isActive;
  final String buttonText;
  final String iconPath;
  final VoidCallback onTap;
  final bool iconIsRight;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmall?36.h:43.h,
      decoration: BoxDecoration(
        color: isActive
            ? MyColors.actionPrimaryDefault
            : MyColors.actionPrimaryDisabled,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: iconIsRight
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonText,
                    style: MyTextStyle.sfProSemiBold.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    iconPath,
                    color: MyColors.white,
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    color: MyColors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    buttonText,
                    style: MyTextStyle.sfProSemiBold.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

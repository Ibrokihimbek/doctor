import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendIconButton extends StatelessWidget {
  const SendIconButton({
    Key? key,
    required this.isActive,
    required this.buttonText,
    required this.onTap,
    required this.iconPath,
    required this.heightSize,
    this.isSmall = false,
  }) : super(key: key);
  final bool isActive;
  final String buttonText;
  final VoidCallback onTap;
  final bool isSmall;
  final String iconPath;
  final double heightSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: heightSize,
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
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText.tr(),
              style: MyTextStyle.sfProSemiBold.copyWith(
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(iconPath, color: MyColors.white),
          ],
        ),
      ),
    );
  }
}

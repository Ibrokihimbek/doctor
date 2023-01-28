import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRate extends StatelessWidget {
  const StarRate({
    super.key,
    required this.rate,
    required this.isActive,
  });

  final String rate;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: 70.w,
      margin: const EdgeInsets.only(right: 12).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24).r,
        color: isActive ? MyColors.primary : MyColors.white,
        border: Border.all(width: 2.w, color: MyColors.actionPrimaryDefault),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SocialIcons.starPurple500,
              color: isActive ? MyColors.white : MyColors.actionPrimaryDefault,
            ),
            SizedBox(width: 4.w),
            Text(
              rate,
              style: MyTextStyle.sfProMedium.copyWith(
                fontSize: 16.sp,
                color:
                    isActive ? MyColors.white : MyColors.actionPrimaryDefault,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

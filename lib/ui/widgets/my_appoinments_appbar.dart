import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class MyAppointments extends StatelessWidget implements PreferredSize {
   MyAppointments({
    super.key,
    required this.logo,
    required this.title,
    required this.onAddTap,
   required this.rightLogo
  });

  final String title;
  final String logo;
  final VoidCallback onAddTap;
  final String rightLogo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w).r,
      child: AppBar(
        backgroundColor: MyColors.neutralWhite,
        elevation: 0,
        leading: Image.asset(logo, width: 36.w, height: 36.h),
        title: Text(
          title,
          style: MyTextStyle.sfProSemiBold
              .copyWith(fontSize: 26.sp, color: MyColors.black),
        ),
        actions: [
          InkWell(
            onTap: onAddTap,
            child: Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: MyColors.primary.withOpacity(0.1),
              ),
              child: Center(
                child: SvgPicture.asset(rightLogo,
                    color: MyColors.primary, width: 24.w, height: 24.h),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

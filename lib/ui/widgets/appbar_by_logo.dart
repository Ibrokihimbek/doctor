import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class AppbarByLogo extends StatelessWidget implements PreferredSize {
  AppbarByLogo({
    super.key,
    required this.logo,
    required this.title,
    required this.onAddTap,
    this.rightLogo = ContentIcons.addCircleOutline,
  });

  String title;
  String logo;
  VoidCallback onAddTap;
  String rightLogo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w).r,
        child: Image.asset(logo, width: 36.w, height: 36.h),
      ),
      title: Text(
        title,
        style: MyTextStyle.sfProSemiBold.copyWith(
          fontSize: 24.sp,
          color: MyColors.black,
        ),
      ),
    
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h).r,
          child: InkWell(
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
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

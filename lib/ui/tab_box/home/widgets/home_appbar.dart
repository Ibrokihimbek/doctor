import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class HomeAppbar extends StatelessWidget implements PreferredSize {
  const HomeAppbar({
    super.key,
    required this.logo,
    required this.title,
    required this.onNotificationTap,
    required this.onFavouritesTap,
    this.favouritesLogo = SocialIcons.notification,
    this.notificationlogo = ActionIcons.favorite,
  });

  final String title;
  final String logo;
  final VoidCallback onNotificationTap;
  final VoidCallback onFavouritesTap;
  final String notificationlogo;
  final String favouritesLogo;

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
          fontSize: 26.sp,
          color: MyColors.black,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h).r,
          child: InkWell(
            onTap: onFavouritesTap,
            child: Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: MyColors.primary.withOpacity(0.1),
              ),
              child: Center(
                child: SvgPicture.asset(notificationlogo,
                    color: MyColors.primary, width: 24.w, height: 24.h),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 24.w, top: 8.h, bottom: 8.h).r,
          child: InkWell(
            onTap: onNotificationTap,
            child: Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: MyColors.primary.withOpacity(0.1),
              ),
              child: Center(
                child: SvgPicture.asset(favouritesLogo,
                    color: MyColors.primary, width: 24.w, height: 24.h),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

import '../../../../utils/icons/app_icons.dart';

class HomeAppbar extends StatelessWidget implements PreferredSize {
  const HomeAppbar({
    super.key,
    required this.logo,
    required this.title,
    required this.onNotificationTap,
    // required this.onFavouritesTap,
    this.favouritesLogo = SocialIcons.notification,
    this.notificationlogo = ActionIcons.favorite,
  });

  final String title;
  final String logo;
  final VoidCallback onNotificationTap;
  // final VoidCallback onFavouritesTap;
  final String notificationlogo;
  final String favouritesLogo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      elevation: 0,
      title: Text(
        title,
        style: MyTextStyle.sfProSemiBold.copyWith(
          fontSize: 26.sp,
          color: MyColors.black,
        ),
      ),

    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

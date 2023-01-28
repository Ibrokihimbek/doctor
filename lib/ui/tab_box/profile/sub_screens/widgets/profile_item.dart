import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/navigation/navigation.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget profileItem({
  required String text,
  required String iconName,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: text == "logout"
                ? MyColors.tertiary2.withOpacity(0.10)
                : MyColors.actionPrimaryDefault.withOpacity(0.10),
          ),
          child: Center(
              child: SvgPicture.asset(
            iconName,
            width: 24.w,
            height: 24.h,
            color:
                text == "logout" ? MyColors.tertiary2 : MyColors.primary,
          )),
        ),
        SizedBox(width: 16.w),
        Text(
          tr("profile_screen.$text"),
          style: MyTextStyle.sfProSemiBold
              .copyWith(fontSize: 16.sp, color: MyColors.neutralBlack),
        ),
        const Spacer(),
        text == "logout"
            ? const SizedBox()
            : SvgPicture.asset(
                NavigationIcons.chevronRight,
                width: 24.w,
                height: 24.h,
                color: MyColors.primary,
              )
      ],
    ),
  );
}

import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallHistoryDoctor extends StatelessWidget {
  const CallHistoryDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16).r,
      child: Container(
        height: 96.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: MyColors.white,
          boxShadow: [
            BoxShadow(
              color: MyColors.primary.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
                image: const DecorationImage(
                  image: NetworkImage("https://i.pravatar.cc/250"),
                  fit: BoxFit.cover,
                ),
              ),
              width: 100.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 62.h,
                    left: 67.w,
                    child: Image.asset(
                      AppIcons.callVoice,
                      width: 36.w,
                      height: 36.h,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 13).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Eleanor Pena',
                    style: MyTextStyle.sfProSemiBold.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  RichText(
                    text: TextSpan(
                      style: MyTextStyle.sfProRegular.copyWith(
                        fontSize: 12.sp,
                        color: MyColors.black,
                      ),
                      text: "Voice Call - ",
                      children: [
                        TextSpan(
                          text: "Completed",
                          style: MyTextStyle.sfProRegular.copyWith(
                            fontSize: 12.sp,
                            color: MyColors.success,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Today, 11:00 - 11:30 AM',
                    style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

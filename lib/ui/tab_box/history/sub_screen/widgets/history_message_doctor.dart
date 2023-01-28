import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesHistoryDoctor extends StatelessWidget {
  const MessagesHistoryDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16).r,
      child: Container(
        height: 88.h,
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
              width: 90.w,
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'Dr. Eleanor Pena',
                  style: MyTextStyle.sfProSemiBold.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Text(
                  '10:00 - 10:30 AM',
                  style: MyTextStyle.sfProSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: MyColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

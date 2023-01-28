import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget notificationItem(
    {required String imgPath, required String title, required String desc}) {
  return Container(
    padding: EdgeInsets.all(10.sp),
    height: 110.h,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          blurRadius: 10.r,
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 3)
    ], borderRadius: BorderRadius.circular(25.r), color: Colors.white),
    child: Container(
      padding: const EdgeInsets.all(1),
      child: Row(
        children: [
          Image.asset(
            imgPath,
            width: 70.w,
          ),
          SizedBox(width: 12.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 18.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                desc,
                style: MyTextStyle.sfProMedium
                    .copyWith(color: Colors.grey, fontSize: 14.sp),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

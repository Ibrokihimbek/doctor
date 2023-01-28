import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Specialist extends StatelessWidget {
  final String color;
  final String imgUrl;
  final String name;
  final String numbers;

  const Specialist(
      {super.key,
      required this.color,
      required this.imgUrl,
      required this.name,
      required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 181.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: Color(int.parse(color)).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imgUrl,
            width: 50.w,
          ),
          SizedBox(height: 16.h),
          Text(
            name,
            style: MyTextStyle.sfProSemiBold
                .copyWith(color: Colors.white, fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            "$numbers doctors".tr(),
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

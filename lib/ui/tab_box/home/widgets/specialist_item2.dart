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
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // color: Color(0xff93d1fe).withOpacity(0.16),
            // blurRadius: 16,
            color: Color(0xff121212).withOpacity(0.07),
            blurRadius: 16,
          )
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imgUrl,
            width: 50.w,
          ),
          SizedBox(height: 16.h),
          Text(
            name,
            style: MyTextStyle.sfProSemiBold
                .copyWith(color: Colors.black, fontSize: 18.sp,fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          // Text(
          //   "$numbers shifokorlar",
          //   style:  TextStyle(color: Colors.white,fontSize: 16.sp),
          // )
        ],
      ),
    );
  }
}

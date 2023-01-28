import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 60.w,
          height: 60.h,
        ),
        SizedBox(height: 8.h),
        Text(
          name,
          style: MyTextStyle.sfProMedium.copyWith(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: MyColors.neutralBlack,
          ),
        ),
      ],
    );
  }
}

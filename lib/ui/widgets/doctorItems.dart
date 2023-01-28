import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/editor/editor.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorItems extends StatelessWidget {
  const DoctorItems({
    Key? key,
    required this.patients,
    required this.yearsExperiences,
    required this.reviews,
  }) : super(key: key);

  final String patients;
  final String yearsExperiences;
  final String reviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          // border: Border.all(width: 1.w, color: MyColors.actionPrimaryDefault),
          color: MyColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration( shape: BoxShape.circle,
                    color: Color(0xff93d1fe).withOpacity(0.2)
                ),
                child: Center(
                  child: Text(
                    patients,
                    style: MyTextStyle.sfProMedium.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "patients".tr(),
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.neutralBlack,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration( shape: BoxShape.circle,
                    color: Color(0xff93d1fe).withOpacity(0.2)
                ),
                child: Center(
                  child: Text(
                    yearsExperiences,
                    style: MyTextStyle.sfProMedium.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "experiences".tr(),
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.neutralBlack,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration( shape: BoxShape.circle,
                    color: Color(0xff93d1fe).withOpacity(0.2)
                ),
                child: Center(
                  child: Text(
                    reviews,
                    style: MyTextStyle.sfProMedium.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "reviews".tr(),
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.neutralBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

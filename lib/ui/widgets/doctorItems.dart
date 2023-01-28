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
          border: Border.all(width: 1.w, color: MyColors.actionPrimaryDefault),
          color: MyColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(9).h.w.r,
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.primary.withOpacity(0.1),
                ),
                child: SvgPicture.asset(
                  SocialIcons.group,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                patients,
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "patients".tr(),
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.neutralBlack,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(9).h.r.w,
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.primary.withOpacity(0.1),
                ),
                child: SvgPicture.asset(
                  SocialIcons.person,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                yearsExperiences,
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "years_experiences".tr(),
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.neutralBlack,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(9).h.w.r,
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.primary.withOpacity(0.1),
                ),
                child: SvgPicture.asset(
                  EditorIcons.insertComment,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                reviews,
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "reviews".tr(),
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 14.sp,
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

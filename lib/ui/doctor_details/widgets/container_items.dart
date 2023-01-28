import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerItems extends StatelessWidget {
  const ContainerItems({
    super.key,
    required this.image,
    required this.doctorName,
    required this.reviewsCount,
    required this.cardioSpecialist,
    required this.rating,
  });

  final String image;
  final String doctorName;
  final num reviewsCount;
  final String cardioSpecialist;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.5.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: MyColors.neutral6,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.network(
              image,
              height: 100.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DR.$doctorName",
                  maxLines: 2,
                  style: MyTextStyle.sfProSemiBold.copyWith(
                    fontSize: 20.sp,
                    color: MyColors.neutralBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      SocialIcons.starHalf,
                      height: 16.h,
                      width: 16.w,
                      color: MyColors.primary,
                    ),
                    Text(
                      "$rating ($reviewsCount reviews)",
                      style: MyTextStyle.sfProLight.copyWith(
                        fontStyle: FontStyle.normal,
                        color: MyColors.neutralBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  "Cardio Specialist - $cardioSpecialist",
                  style: MyTextStyle.sfProRegular.copyWith(
                    fontSize: 14.sp,
                    color: MyColors.neutralBlack,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w)
        ],
      ),
    );
  }
}

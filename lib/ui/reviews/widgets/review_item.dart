import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.image,
    required this.name,
    required this.comment,
    required this.online,
    required this.rating,
  });

  final String image;
  final String name;
  final String comment;
  final String online;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16).h,
      padding: const EdgeInsets.only(left: 13, top: 17.5, right: 22).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        border: Border.all(color: MyColors.neutral8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 62.h,
            width: 62.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: MyTextStyle.sfProSemiBold.copyWith(
                            fontSize: 18.sp,
                            color: MyColors.neutralBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          online,
                          style: MyTextStyle.sfProLight.copyWith(
                            fontStyle: FontStyle.normal,
                            color: MyColors.neutral3,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Container(
                      height: 33.h,
                      width: 42.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.82).r,
                          color: MyColors.otherGradient1[1]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SocialIcons.starPurple500,
                              width: 16.w,
                              height: 16.h,
                              color: MyColors.neutralWhite),
                          SizedBox(width: 3.w),
                          Text(
                            "$rating",
                            style: MyTextStyle.sfProMedium.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: MyColors.neutralWhite,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  comment,
                  style: MyTextStyle.sfProRegular.copyWith(
                    fontSize: 14.sp,
                    color: MyColors.neutralBlack,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          SizedBox(width: 20.w)
        ],
      ),
    );
  }
}

import 'package:doctor_app/ui/widgets/custom_icon_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/style.dart';

class DoctorCardItem extends StatelessWidget {
  DoctorCardItem({
    super.key,
    required this.image,
    required this.doctorName,
    required this.rating,
    required this.reviewsCount,
    required this.cardioSpecialist,
    required this.isOutlined,
    this.onFavouriteTap,
    this.onTap,
  });

  String image;
  bool isOutlined;
  String doctorName;
  double rating;
  int reviewsCount;
  String cardioSpecialist;
  VoidCallback? onFavouriteTap;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.all(12).r,
        margin:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h, bottom: 12.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff121212).withOpacity(0.12),
              blurRadius: 8
            )
          ],
          borderRadius: BorderRadius.circular(12.r),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xff7DE5ED)),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(150)),
                child: Image.network(
                  image,
                  height: 80.h,
                  width: 80.w,
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
                  Text(
                    "Dr.$doctorName",
                    maxLines: 2,
                    style: MyTextStyle.sfProSemiBold.copyWith(
                      fontSize: 16.sp,
                      // color: MyColors.neutralBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                          // color: MyColors.neutralBlack,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                    "Cardio Specialist - $cardioSpecialist",
                    style: MyTextStyle.sfProRegular.copyWith(
                      fontSize: 11.sp,
                      // color: MyColors.neutralBlack,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            CustomIconButton(
              isSmall: true,
              iconPath: isOutlined
                  ? ActionIcons.favorite
                  : ActionIcons.favoriteBorder,
              onTap: onFavouriteTap ?? () {},
            ),
            SizedBox(
              width: 20.w,
            )
          ],
        ),
      ),
    );
  }
}

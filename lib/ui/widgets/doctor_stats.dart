import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/communication/communication.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorStats extends StatelessWidget {
  const DoctorStats({
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
      width: 380.w,
      height: 132.h,
      padding: EdgeInsets.only(top: 16.h).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(width: 1.w, color: MyColors.actionPrimaryDefault),
          color: MyColors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          statsItems(SocialIcons.group, patients, "patients"),
          statsItems(SocialIcons.person, yearsExperiences, "years_experiences"),
          statsItems(CommunicationIcons.chat, reviews, "reviews"),
        ],
      ),
    );
  }

  Widget statsItems(
    String statsImg,
    String statsNumbers,
    String stats,
  ) {
    return Column(
      children: [
        Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.primary.withOpacity(0.1),
          ),
          child: Center(
            child: SvgPicture.asset(
              statsImg,
              color: MyColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 108.w,
          height: 24.h,
          child: Center(
            child: Text(
              statsNumbers,
              style: MyTextStyle.sfProSemiBold
                  .copyWith(fontSize: 16.sp, color: MyColors.primary),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          //  width: 108,
          height: 22.h,
          child: Center(
            child: Text(
              tr('doctor_stats.$stats'),
              style: MyTextStyle.sfProRegular
                  .copyWith(fontSize: 14.sp, color: MyColors.neutralBlack),
            ),
          ),
        ),
      ],
    );
  }
}

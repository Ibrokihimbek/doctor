import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MorningAndEvening extends StatelessWidget {
  final String icon;
  final String text;
  final Color containerColor;
  final Color textColor;
  final Color sunColor;

  const MorningAndEvening({
    Key? key,
    required this.icon,
    required this.text,
    required this.containerColor,
    required this.textColor,
    required this.sunColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 10).r,
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: MyColors.actionPrimaryDefault,
          ),
          borderRadius: BorderRadius.circular(20).w,
          color: containerColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color: sunColor,
          ),
          SizedBox(width: 10.w),
          Text(
            text.tr(),
            style: MyTextStyle.sfProSemiBold.copyWith(
              fontSize: 16.sp,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

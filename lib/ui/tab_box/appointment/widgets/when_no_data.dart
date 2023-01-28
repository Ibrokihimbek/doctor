import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/icons/social/social.dart';

class MessNoDataScreen extends StatelessWidget {
  const MessNoDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.15,),

          Center(
            child: Stack(
              children: [
                SvgPicture.asset(
                  ContentIcons.appointment_empty,
                  color: MyColors.otherGradient1.first,
                  width: 250.w,
                  height: 240.h,
                ),
                Positioned(
                  left: 100,
                  bottom: 95,
                  child: SvgPicture.asset(
                    SocialIcons.sentimentDissatisfied,
                    color: Colors.white,
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'you_don`t_have_an_appointment'.tr(),
            style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 23.sp),
          ),
        ],
      ),
    );
  }
}

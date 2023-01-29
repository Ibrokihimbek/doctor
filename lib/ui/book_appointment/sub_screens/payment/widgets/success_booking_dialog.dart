import 'package:doctor_app/ui/widgets/global_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void SuccessDialog(
    {required BuildContext context, required imagePath, required desc}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          content: SizedBox(
            width: 320.w,
            height: 446.h,
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  scale: 2.5,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Successfull',
                  style: MyTextStyle.sfProSemiBold
                      .copyWith(color: MyColors.primary, fontSize: 29.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(desc,textAlign: TextAlign.center,),
                SizedBox(
                  height: 24.h,
                ),
                GlobalButton(
                  isActive: true,
                  buttonText: 'ok',
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, tabBox, (route) => false);
                  },
                )
              ],
            ),
          ),
        );
      });
}

void ErrorDialog(
    {required BuildContext context, required imagePath, required desc}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          content: SizedBox(
            width: 320.w,
            height: 446.h,
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  scale: 2.5,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Oops, Failed',
                  style: MyTextStyle.sfProSemiBold
                      .copyWith(color: MyColors.tertiary2, fontSize: 29.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(desc),
                SizedBox(
                  height: 24.h,
                ),
                GlobalButton(
                  isActive: true,
                  buttonText: 'Try Again',
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      });
}

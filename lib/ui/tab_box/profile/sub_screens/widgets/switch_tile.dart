import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customSwitch(String text, bool value, Function onChangeMethod) {
  return Padding(
    padding: EdgeInsets.only(top: 22.h, left: 16.w, right: 16.w).r,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
        tr("custom_switch.$text"),
          style: MyTextStyle.sfProMedium
              .copyWith(color: MyColors.neutralBlack, fontSize: 16.sp),
        ),
        const Spacer(),
        SizedBox(
          width: 56.w,
          height: 32.h,
          child: CupertinoSwitch(
              trackColor: MyColors.actionNeutralDefault,
              activeColor: MyColors.primary,
              value: value,
              onChanged: (newValue) {
                onChangeMethod(newValue);
              }),
        )
      ],
    ),
  );
}

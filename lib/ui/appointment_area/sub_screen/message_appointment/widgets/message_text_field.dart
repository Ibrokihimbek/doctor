import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({super.key});
  //TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            width: 1.w,
            color: MyColors.neutral8,
          ),
        ),
        hintText: "Type message ...",
        hintStyle: MyTextStyle.sfProRegular
            .copyWith(color: MyColors.neutral6, fontSize: 16.sp),
        suffix: InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            ContentIcons.send,
            width: 32.w,
            height: 32.h,
            color: MyColors.primary,
          ),
        ),
      ),
    );
  }
}

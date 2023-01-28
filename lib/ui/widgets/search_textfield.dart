import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';

class SearchTextFieldd extends StatelessWidget {
  const SearchTextFieldd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 45.h,
      width: 324.w,
      // margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: MyColors.neutral9,
          borderRadius: BorderRadius.circular(32)),

      child: TextFormField(
        cursorColor: Colors.black,
        // keyboardType: TextInputType.,
        decoration: InputDecoration(

          hintStyle: TextStyle(
              fontSize: 14.sp,

              fontWeight: FontWeight.w400,
              color: MyColors.neutralBlack),
          hintText: 'Search',
          suffixIcon: SvgPicture.asset(
            ActionIcons.search,
            height: 24.h,
            width: 24.w,

            color: MyColors.neutral5,
            fit: BoxFit.scaleDown,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(18),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/color.dart';
import '../../utils/icons/action/action.dart';
import '../../utils/style.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: MyColors.neutral9,
      ),
      child: TextFormField(
        onChanged: (value) {},
        // controller: searchController,
        // focusNode: searchFocusNode,
        textInputAction: TextInputAction.done,
        style: MyTextStyle.sfProMedium.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: MyColors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: tr('global.search'),
          hintStyle: MyTextStyle.sfProMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: MyColors.black.withOpacity(0.8),
          ),
          suffixIcon: SvgPicture.asset(
            ActionIcons.search,
            color: MyColors.neutral5,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}

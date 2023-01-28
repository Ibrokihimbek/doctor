import 'package:doctor_app/ui/widgets/search_text_field.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(child: SearchTextField()),
        SizedBox(width: 12.w,),
        InkWell(
          onTap: () {},
          child: Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: MyColors.primary.withOpacity(0.1),
            ),
            child: Center(
              child: SvgPicture.asset(ContentIcons.filterList,
                  color: MyColors.primary, width: 24.w, height: 24.h),
            ),
          ),
        ),
      ],
    );
  }
}

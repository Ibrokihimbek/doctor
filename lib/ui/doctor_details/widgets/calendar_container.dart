import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarContainer extends StatelessWidget {
  const CalendarContainer({
    super.key,
    required this.week,
    required this.date, required this.select,
  });
  final bool select;
  final String week;
  final int date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff121212).withOpacity(0.1),
            blurRadius: 6,
          )
        ],
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(width: 1.w, color: MyColors.otherGradient1[1]),
        color: select == true ? MyColors.primary : MyColors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              week,
              style: MyTextStyle.sfProRegular.copyWith(
                fontSize: 14.sp,
                color: select == true ? MyColors.white : MyColors.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 4.h,),
            Text(
              "$date",
              style: MyTextStyle.sfProRegular.copyWith(
                fontSize: 23,
                color: select == true ? MyColors.white : MyColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorItem extends StatelessWidget {
  DoctorItem(
      {super.key,
      required this.name,
      required this.time,
      required this.imgName});
  String name;
  String time;
  String imgName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: MyColors.neutralWhite,
        border: Border.all(width: 1.w, color: Colors.grey),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
              child: Image.network(
                imgName,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 14.h,
              left: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: MyTextStyle.sfProSemiBold
                      .copyWith(color: MyColors.neutralBlack, fontSize: 16.sp),
                ),
                Text(
                  time,
                  style: MyTextStyle.sfProRegular
                      .copyWith(color: MyColors.neutralBlack, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

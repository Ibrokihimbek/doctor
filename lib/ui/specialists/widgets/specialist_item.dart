import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistWidget extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String count;
  final String bcColor;
  const SpecialistWidget(
      {super.key,
      required this.bcColor,
      required this.imgUrl,
      required this.name,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147.h,
      width: 160.w,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(int.parse(bcColor)).withOpacity(0.8),
            Color(int.parse(bcColor))
          ]),
          borderRadius: BorderRadius.circular(25)),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imgUrl),
          SizedBox(
            height: 12.h,
          ),
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            "$count doctors".tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

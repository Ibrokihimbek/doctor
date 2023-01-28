import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopDoctors extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String specialist;

  final VoidCallback onTap;

  const TopDoctors({
    super.key,
    required this.imgUrl,
    required this.onTap,
    required this.name,
    required this.specialist,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(0.1),
        width: 140.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(20.r)),

        child: Column(
          children: [
            Container(
              height: 138.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              name,
              style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 18.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(specialist)
          ],
        ),
      ),
    );
  }
}

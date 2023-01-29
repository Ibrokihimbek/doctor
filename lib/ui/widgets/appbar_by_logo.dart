import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class AppbarByLogo extends StatelessWidget implements PreferredSize {
  AppbarByLogo({
    super.key,
    required this.logo,
    required this.title,
    required this.onAddTap,
    this.rightLogo = ContentIcons.addCircleOutline,
    this.yesLogo = true,
  });

  bool yesLogo;
  String title;
  String logo;
  VoidCallback onAddTap;
  String rightLogo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      elevation: 0,
      title: Text(
        title,
        style: MyTextStyle.sfProSemiBold.copyWith(
          fontSize: 24.sp,
          color: MyColors.black,
        ),
      ),
      actions: [
        yesLogo == false
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h).r,
                child: InkWell(
                  onTap: onAddTap,
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Color(0xff2972FE),
                    ),
                    child: Center(
                      child: SvgPicture.asset(rightLogo,
                          color: Colors.white, width: 24.w, height: 24.h),
                    ),
                  ),
                ),
              )
      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MyColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

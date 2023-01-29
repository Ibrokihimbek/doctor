import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class AppbarByLogoWidget extends StatelessWidget implements PreferredSize {
  AppbarByLogoWidget({
    super.key,
    required this.logo,
    required this.title,
    required this.onAddTap,
  });

  String title;
  String logo;
  VoidCallback onAddTap;

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

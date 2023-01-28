import 'package:doctor_app/utils/icons/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.title, required this.widget});

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(padding: EdgeInsets.symmetric(vertical: 8.h).r, child: widget),
        SizedBox(
          width: 24.w,
        ),
      ],
     // backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          NavigationIcons.arrowBack,
          color: MyColors.actionPrimaryActive,
          width: 24.w,
          height: 24.h,
        ),
      ),
      title: Expanded(
        child: Text(
          title,
          style: MyTextStyle.sfProSemiBold
              .copyWith(fontSize: 26.sp, color: Theme.of(context).textTheme.headline6!.color),
        ),
      ),
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: MyColors.white,
      //   statusBarIconBrightness: Brightness.dark,
      //   statusBarBrightness: Brightness.light,
      // ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

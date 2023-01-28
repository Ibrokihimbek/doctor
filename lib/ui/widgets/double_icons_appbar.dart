import 'package:doctor_app/ui/widgets/custom_icon_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:doctor_app/utils/icons/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DoubleIconsAppBar extends StatelessWidget implements PreferredSize {
  DoubleIconsAppBar({
    super.key,
    required this.onLeftTap,
    required this.title,
    required this.onRightTap,
    required this.leftIcon,
    required this.rightIcon,
  });

  String title;
  String leftIcon;
  String rightIcon;
  VoidCallback onLeftTap;
  VoidCallback onRightTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          NavigationIcons.arrowBack,
          color: MyColors.actionPrimaryDefault,
        ),
      ),
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
      actions: [
        Center(
          child: CustomIconButton(
            iconPath: leftIcon,
            onTap: onLeftTap,
          ),
        ),
         SizedBox(width: 16.w),
        Center(
          child: CustomIconButton(
            iconPath: rightIcon,
            onTap: onRightTap,
          ),
        ),
         SizedBox(width: 24.w)
      ],
    );
  }

  @override
  Widget get child => SizedBox();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

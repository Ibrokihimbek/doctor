import 'package:doctor_app/ui/widgets/custom_icon_button.dart';
import 'package:doctor_app/utils/icons/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class SingleIconAppBar extends StatelessWidget implements PreferredSize {
  SingleIconAppBar({
    super.key,
    required this.onTap,
    required this.title,
    required this.svgIcon,
  });

  String title;
  String svgIcon;
  VoidCallback onTap;

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
          color: Colors.blue,
        ),
      ),
      title: Text(
        title,
        style: MyTextStyle.sfProSemiBold.copyWith(
          fontSize: 24,
          color: MyColors.black,
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MyColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      actions: [
        (svgIcon.isNotEmpty)
            ? Center(
                child: CustomIconButton(
                  iconPath: svgIcon,
                  onTap: onTap,
                ),
              )
            : const SizedBox(),
        const SizedBox(width: 24)
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

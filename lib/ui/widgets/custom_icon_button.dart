import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_app/utils/color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.iconPath,
    required this.onTap,
    this.isSmall = false,
  }) : super(key: key);

  final String iconPath;
  final VoidCallback onTap;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSmall ? 36 : 40,
      height: isSmall ? 36 : 40,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shadowColor: Color(0xff121212).withOpacity(0.3),
          surfaceTintColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: SvgPicture.asset(
          iconPath,
          color: MyColors.primary,
          width: isSmall ? 16: 24,
          height: isSmall ? 16 : 24,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class ChipTextButton extends StatelessWidget {
  const ChipTextButton({
    Key? key,
    required this.isActive,
    required this.buttonText,
    required this.onTap,
    this.height,
  }) : super(key: key);
  final bool isActive;
  final String buttonText;
  final VoidCallback onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 43,
      decoration: BoxDecoration(
        color: isActive
            ? MyColors.actionPrimaryDefault
            : MyColors.actionPrimaryDisabled,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: Text(
          buttonText,
          style: MyTextStyle.sfProSemiBold.copyWith(
            fontSize:  height == null ? 18 : 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

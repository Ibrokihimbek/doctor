import 'package:doctor_app/ui/doctor_details/widgets/custom_text_bold.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextBold(text: text, color: MyColors.neutral1),
        const SizedBox(),
      ],
    );
  }
}

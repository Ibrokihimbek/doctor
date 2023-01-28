import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.controller,
    required this.text,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.textInputType,
    this.inputFormatters,
    this.isDone = false,
  }) : super(key: key);

  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final String text;
  final ValueChanged? onChanged;
  bool? isDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Text(tr('patient_details_screen.$text'),
                style: MyTextStyle.sfProSemiBold.copyWith(
                    color: MyColors.neutral1.withOpacity(0.8), fontSize: 16),),
            Text("*",
                style: MyTextStyle.sfProBold.copyWith(color: MyColors.error),),
          ],
        ),
        const SizedBox(height: 10),
        Material(
          borderRadius: BorderRadius.circular(30),
          shadowColor: Colors.blue.withOpacity(0.12),
          elevation: 25,
          child: TextFormField(
            textInputAction:
                isDone! ? TextInputAction.done : TextInputAction.next,
            onChanged: onChanged,
            style: MyTextStyle.sfProSemiBold.copyWith(
                color: MyColors.neutralBlack,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            obscureText: (text == "Password" || text == "Confirm Password"
                ? true
                : false),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            controller: controller,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: tr('patient_details_screen.$text'),
              contentPadding: const EdgeInsets.only(left: 20),
              hintStyle: MyTextStyle.sfProSemiBold
                  .copyWith(color: MyColors.neutral7, fontSize: 16),
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: MyColors.neutral8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: MyColors.primary, width: 2),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                borderSide: BorderSide(color: MyColors.error),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                borderSide: BorderSide(color: MyColors.error),
              ),
            ),
            cursorColor: MyColors.primary,
          ),
        ),
      ],
    );
  }
}

import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  final String word;
  final bool isTreu;
  const TextFieldWidget({super.key, required this.word, required this.isTreu});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.05),
          child: RichText(
            text: TextSpan(
              text:tr("contact_us.$word"),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.01,
        ),
        Container(
          height: isTreu ? height(context) * 0.066 : height(context) * 0.2,
          width: width(context),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(-40, 40),
                color: const Color(0xFF93b8EF).withOpacity(0.1),
                spreadRadius: -40,
                blurRadius: 40,
              ),
              BoxShadow(
                offset: const Offset(40, 40),
                color: const Color(0xFF93b8EF).withOpacity(0.1),
                spreadRadius: -40,
                blurRadius: 40,
              ),
            ],
            borderRadius: isTreu
                ? BorderRadius.circular(height(context) * 0.1)
                : BorderRadius.circular(height(context) * 0.024),
          ),
          child: isTreu
              ? TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((value) => value != null && value.length < 2
                      ? "Kamida 2 ta belgi kiriting!"
                      : null),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: width(context) * 0.06),
                    border: InputBorder.none,
                    hintText: tr("contact_us.$word"),
                    hintStyle: const TextStyle(color: MyColors.neutral7),
                    helperStyle: const TextStyle(color: Colors.black26),
                  ),
                )
              : TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((value) => value != null && value.length < 2
                      ? "Kamida 2 ta belgi kiriting!"
                      : null),
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: width(context) * 0.06,
                        top: height(context) * 0.024),
                    border: InputBorder.none,
                    hintText: tr("contact_us.$word"),
                    hintStyle: const TextStyle(color: MyColors.neutral7),
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                ),
        ),
      ],
    );
  }
}

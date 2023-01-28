import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListScrenn extends StatelessWidget {
  final String word;
  final bool isTrue;

  const ListScrenn({
    super.key,
    required this.word,
    required this.isTrue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTrue ? height(context) * 0.15 : height(context) * 0.07,
      width: width(context),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(-10, 10),
              color: const Color(0xFF93b8EF).withOpacity(0.2),
              spreadRadius: -30,
              blurRadius: 50),
          BoxShadow(
              offset: const Offset(10, -10),
              color: const Color(0xFF93b8EF).withOpacity(0.4),
              spreadRadius: -40,
              blurRadius: 40),
        ],
        borderRadius: BorderRadius.circular(height(context) * 0.015),
        border: isTrue
            ? Border.all(color: MyColors.primary)
            : Border.all(color: MyColors.white),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.06),
        child: Column(children: [
          SizedBox(
            height: height(context) * 0.016,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("faq_screen.$word")),
              const Icon(
                Icons.arrow_drop_down,
                color: MyColors.primary,
              )
            ],
          ),
          isTrue
              ? Column(
                  children: [
                    SizedBox(
                      height: height(context) * 0.007,
                    ),
                    const Divider(
                      thickness: 0.7,
                      color: Colors.black12,
                    ),
                    SizedBox(height: height(context) * 0.003),
                    Text(
                      tr('faq_screen.doctorQ_is_greatest_medical_online_consultation_app_platform_in_this_century.'),
                      style: TextStyle(height: 1.3.h),
                    )
                  ],
                )
              : SizedBox(
                  height: height(context) * 0.00001,
                  width: width(context),
                )
        ]),
      ),
    );
  }
}

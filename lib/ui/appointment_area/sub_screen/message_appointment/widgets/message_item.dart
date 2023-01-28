import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.isMe});
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h).r,
          child: Container(
            height: 96.h,
            width: 340.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isMe
                  ? const Color.fromRGBO(41, 114, 254, 0.8)
                  : MyColors.neutral9,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 12.h,
                  left: 20.w,
                  child: Text(
                    "First, can you tell me about your illness so far",
                    softWrap: true,
                    style: MyTextStyle.sfProRegular.copyWith(
                      fontSize: 16.sp,
                      color: MyColors.neutralBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String word;
  const RichTextWidget({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width(context) * 0.05),
      child: RichText(
        text: TextSpan(
          text: word,
          style: const TextStyle(
            color: MyColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          children: const [
            TextSpan(
              text: '*',
              style: TextStyle(color: MyColors.error, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/help/sub_screens/faq/widgets/list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomExtantion extends StatelessWidget {
  const CustomExtantion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context) * 0.06),
      child: Column(
        children: [
          SizedBox(
            height: height(context) * 0.028,
          ),
          const ListScrenn(
            isTrue: true,
            word: 'what_is_DoctorQ?',
          ),
          SizedBox(
            height: height(context) * 0.028,
          ),
          const ListScrenn(
            isTrue: false,
            word: 'how_to_use_DoctorQ?',
          ),
          SizedBox(
            height: height(context) * 0.028,
          ),
          const ListScrenn(
            isTrue: false,
            word: 'is_DoctorQ_is_safe_for_me?',
          ),
          SizedBox(
            height: height(context) * 0.028,
          ),
          const ListScrenn(
            isTrue: false,
            word: 'how_to_schedule_consultation_DoctorQ?',
          ),
          SizedBox(
            height: height(context) * 0.028,
          ),
          const ListScrenn(
            isTrue: false,
            word: 'how_to_logout_from_DoctorQ?',
          ),
          SizedBox(
            height: height(context) * 0.028,
          ),
          const ListScrenn(
            isTrue: false,
            word: 'is_there_a_free_tips_to_get_health_this_app',
          ),
          SizedBox(
            height: height(context) * 0.028,
          ),
          const ListScrenn(
            isTrue: false,
            word: 'is_DoctorQ_free_to_use?',
          ),
        ],
      ),
    );
  }
}

import 'package:doctor_app/ui/tab_box/history/sub_screen/widgets/history_message_doctor.dart';
import 'package:doctor_app/ui/widgets/single_icon_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/navigation/navigation.dart';
import 'package:flutter/material.dart';

class MessagesHistoryDetailScreen extends StatelessWidget {
  MessagesHistoryDetailScreen({super.key});

  List<String> wordsOne = [
    'Hello Adam, I am Dr. Eleanor Pena. I will help to solve your disease complaints',
    'First, can you tell me about your illness so for',
    'This is very important so that I can help identify your disease and the solution',
    'Hello Dr. Eleanor Pena.',
    'First, can you tell me about your illness so for',
    'This is very important so that I can help identify your disease and the solution'
  ];
  
  List<bool> messegBool = [
   false,
   true,
   false,
   true,
   false,
   true
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SingleIconAppBar(
        onTap: () {},
        title: 'Messaging',
        svgIcon: NavigationIcons.moreVert,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.066),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height(context) * 0.018),
            const MessagesHistoryDoctor(),
             Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: wordsOne.length,
                itemBuilder: (context, index) {
                  return messeg(
                    context: context,
                    word: wordsOne[index],
                    index: index,
                    isTrue: messegBool[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  messeg({
    required BuildContext context,
    required String word,
    required int index,
    required bool isTrue,
  }) {
    return Padding(
      padding: EdgeInsets.only(
          top: index == 0 ? height(context) * 0.022 : height(context) * 0.017,
          left: isTrue ? width(context) * 0.12 : 0,right: isTrue?0:width(context) * 0.12),
      child: Container(
        width: width(context) * 0.74,
        decoration: BoxDecoration(
          color: isTrue?MyColors.primary.withOpacity(0.8): MyColors.neutral9,
          borderRadius: index == 0
              ? BorderRadius.only(
                  topLeft: isTrue
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                  topRight: isTrue
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomLeft: const Radius.circular(12),
                  bottomRight: const Radius.circular(12))
              : BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              right: width(context) * 0.14,
              top: height(context) * 0.018,
              left: width(context) * 0.06,
              bottom: height(context) * 0.018),
          child: Text(
            word,
            style: TextStyle(
              height: 1.34,
              color: isTrue ? MyColors.neutral9 : MyColors.black,
            ),
          ),
        ),
      ),
    );
  }
}

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;

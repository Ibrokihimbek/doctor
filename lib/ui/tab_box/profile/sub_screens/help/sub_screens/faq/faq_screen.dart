import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/help/sub_screens/faq/widgets/custom_extantion.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int pageIndex = 0;
  bool isTreu = false;
  List<String> listItem = [
    "general",
    "login",
    "account",
    "doctor",
    "tips",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(widget: SizedBox(), title: 'FAQ'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        child: Column(
          children: [
            SizedBox(
              width: width(context),
              height: height(context) * 0.062,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: listItem.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: height(context) * 0.015,
                        left: width(context) * 0.03),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24.r),
                      onTap: () {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                      child: Container(
                        width: width(context) * 0.23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: pageIndex == index
                              ? MyColors.primary
                              : MyColors.white,
                          border: Border.all(
                            color: MyColors.primary,
                            width: 2.w,
                          ),
                        ),
                        child: Center(
                          child: Text(
                           tr("faq_screen.${ listItem[index]}"),
                            style: TextStyle(
                              color: pageIndex != index
                                  ? MyColors.primary
                                  : MyColors.white,
                            ),textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const CustomExtantion()
          ],
        ),
      ),
    );
  }
}

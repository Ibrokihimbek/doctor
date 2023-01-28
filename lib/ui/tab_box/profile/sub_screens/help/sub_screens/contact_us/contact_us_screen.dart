import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/help/sub_screens/contact_us/widgets/textfield_message.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/ui/widgets/send_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        widget: const SizedBox(),
        title: tr("help_screen.contact_us"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.066),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height(context) * 0.02,
                ),
                const TextFieldWidget(word: 'full_name', isTreu: true),
                SizedBox(
                  height: height(context) * 0.04,
                ),
                const TextFieldWidget(word: 'email', isTreu: true),
                SizedBox(
                  height: height(context) * 0.04,
                ),
                const TextFieldWidget(
                  word: 'message',
                  isTreu: false,
                ),
                SizedBox(
                  height: height(context) * 0.04,
                ),
                SendIconButton(
                  isActive: false,
                  buttonText: tr("contact_us.send_message"),
                  onTap: () {},
                  iconPath: ContentIcons.send,
                  heightSize: 53.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration getInputDecoration(
  context, {
  required IconData icon,
  required String word,
}) {
  return InputDecoration(
    // suffixIcon:
    suffixIcon: Icon(
      icon == Icons.email ? icon : null,
      color: Colors.black54,
    ),
    hintText: word,
    hintStyle: const TextStyle(color: Colors.black26),
    labelStyle: const TextStyle(color: Colors.blue),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(height(context) * 0.5),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.blue,
      ),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(height(context) * 0.5),
        borderSide: const BorderSide(width: 1, color: Colors.black26)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(height(context) * 0.5),
      borderSide: const BorderSide(width: 1, color: Colors.black26),
    ),
  );
}

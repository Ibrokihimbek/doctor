import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/help/sub_screens/contact_us/contact_us_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/help/sub_screens/faq/faq_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/help/sub_screens/privacy_policy/privacy_policy_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/help/sub_screens/terms_and_conditions/terms_and_conditions_sreen.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        widget: const SizedBox(),
        title: tr('profile_screen.help'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.02),
          child: Column(
            children: [
              widgetTitle(context, 'faq', true, const FaqScreen()),
              widgetTitle(context, 'contact_us', true, ContactUs()),
              widgetTitle(context, 'terms_&_conditions', true,
                  const TermsAndCondition()),
              widgetTitle(context, 'privay_policy', false, const Privacy()),
            ],
          ),
        ),
      ),
    );
  }

  widgetTitle( context, String word,  bool isTrue, navigator) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => navigator));
          },
          title: Text(
            tr('help_screen.$word'),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),
          trailing: const Icon(
            Icons.chevron_right_sharp,
            color: Colors.blue,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.03),
          child: isTrue
              ? const Divider(
                  thickness: 0.7,
                  color: Colors.black12,
                )
              : null,
        ),
      ],
    );
  }
}

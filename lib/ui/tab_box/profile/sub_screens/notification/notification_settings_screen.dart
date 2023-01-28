import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/switch_tile.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  onChangeMethod(bool newValue) {
    setState(() {
      value = newValue;
    });
  }

  onChangeMethod1(bool newValue1) {
    setState(() {
      value1 = newValue1;
    });
  }

  onChangeMethod2(bool newValue2) {
    setState(() {
      value2 = newValue2;
    });
  }

  onChangeMethod3(bool newValue3) {
    setState(() {
      value3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        widget: const SizedBox(),
        title:tr( "profile_screen.notification"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSwitch("sound", value, onChangeMethod),
            SizedBox(height: 16.h),
            const Divider(thickness: 1),
            customSwitch("vibrate", value1, onChangeMethod1),
            SizedBox(height: 16.h),
            const Divider(thickness: 1),
            customSwitch("new_tips_available", value2, onChangeMethod2),
            SizedBox(height: 16.h),
            const Divider(thickness: 1),
            customSwitch("new_service_available", value3, onChangeMethod3),
          ],
        ),
      ),
    );
  }
}

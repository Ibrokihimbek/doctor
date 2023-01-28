import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/switch_tile.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({Key? key}) : super(key: key);

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: tr("profile_screen.security"),
        widget:  const SizedBox(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSwitch("face_id", value, onChangeMethod),
            SizedBox(height: 16.h),
            const Divider(thickness: 1),
            customSwitch("remember_me", value1, onChangeMethod1),
            SizedBox(height: 16.h),
            const Divider(thickness: 1),
            customSwitch("touch_id", value2, onChangeMethod2),
          ],
        ),
      ),
    );
  }
}

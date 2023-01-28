import 'package:doctor_app/ui/tab_box/history/sub_screen/widgets/history_call_doctor.dart';
import 'package:doctor_app/ui/widgets/chip_icon_button.dart';
import 'package:doctor_app/ui/widgets/global_button.dart';
import 'package:doctor_app/ui/widgets/global_icon_button.dart';
import 'package:doctor_app/ui/widgets/single_icon_appbar.dart';
import 'package:doctor_app/utils/icons/av/av.dart';
import 'package:doctor_app/utils/icons/navigation/navigation.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallHistoryDetailScreen extends StatelessWidget {
  CallHistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SingleIconAppBar(
        onTap: () {},
        title: 'Voice Call',
        svgIcon: NavigationIcons.moreVert,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h),
            CallHistoryDoctor(),
            SizedBox(height: 24.h),
            const Divider(thickness: 1),
            SizedBox(height: 24.h),
            Text(
              '30 minutes of voice calls have been recorded',
              style: MyTextStyle.sfProRegular.copyWith(fontSize: 16.sp),
            ),
            SizedBox(height: 24.h),
            GlobalIconButton(
              isActive: true,
              buttonText: 'Play Recording',
              onTap: () {},
              iconPath: AvIcons.playCircleFilledWhite,
              heightSize: 53.h,
            ),
          ],
        ),
      ),
    );
  }
}

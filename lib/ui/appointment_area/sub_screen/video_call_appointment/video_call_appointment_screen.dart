import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/ui/widgets/custom_icon_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:doctor_app/utils/icons/av/av.dart';
import 'package:doctor_app/utils/icons/communication/communication.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Appointments',
          widget: SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 2.0,
              height: MediaQuery.of(context).size.width * 0.30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 2, color: Colors.grey.withOpacity(0.4))),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.60,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppIcons.nurse),
                                fit: BoxFit.cover),
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(11),
                              bottomLeft: Radius.circular(11),
                            )),
                      ),
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: 36,
                            height: 36,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10)),
                                gradient: LinearGradient(
                                    colors: MyColors.otherGradient1)),
                            child: SvgPicture.asset(
                              AvIcons.videoCam,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("Dr. Jenny Wilson"),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Text("Video Call - "),
                            Text(
                              'Scheduled',
                              style: MyTextStyle.sfProLight
                                  .copyWith(color: MyColors.statusinfo),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("11:00 - 11:30 AM")
                      ],
                    ),
                  ),
                  CustomIconButton(iconPath: AvIcons.videoCam, onTap: () {}),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: MyColors.otherGradient1[0], width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.primary.withOpacity(0.1)),
                        child: SvgPicture.asset(
                          SocialIcons.group,
                          color: MyColors.primary,
                        ),
                      ),
                      Text(
                        '5000+',
                        style: MyTextStyle.sfProSemiBold.copyWith(
                            color: MyColors.otherGradient1[0], fontSize: 16),
                      ),
                      Text(
                        'Patients',
                        style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.primary.withOpacity(0.1)),
                        child: SvgPicture.asset(
                          SocialIcons.person,
                          color: MyColors.primary,
                        ),
                      ),
                      Text(
                        '15+',
                        style: MyTextStyle.sfProSemiBold.copyWith(
                            color: MyColors.otherGradient1[0], fontSize: 16),
                      ),
                      Text(
                        'Years experiences',
                        style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.primary.withOpacity(0.1)),
                        child: SvgPicture.asset(
                          CommunicationIcons.chat,
                          color: MyColors.primary,
                        ),
                      ),
                      Text(
                        '3800+',
                        style: MyTextStyle.sfProSemiBold.copyWith(
                            color: MyColors.otherGradient1[0], fontSize: 16),
                      ),
                      Text(
                        'Reviews',
                        style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Visit Time',
              style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(

              'Morning',
              style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Monday, March 27 2022',
              style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '11:00 - 11:30 AM',
              style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 14,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 14,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Patient Information',
              style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Full Name   :',
              style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Age   :',
              style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Phone    :',
              style: MyTextStyle.sfProRegular.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 14,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Fee Information',
                style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '\$20 (Paid)',
                style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 16,color: Colors.blue),
              ),
            ],)
          ],
        ),
      ),
    );
  }
}

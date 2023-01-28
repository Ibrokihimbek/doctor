import 'package:doctor_app/data/local/local_database.dart';
import 'package:doctor_app/data/service/notification_app.dart';
import 'package:doctor_app/ui/notification/cubit/notification_cubit.dart';
import 'package:doctor_app/ui/notification/cubit/notification_state.dart';
import 'package:doctor_app/ui/notification/widgets/notification_item.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotificationCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              color: Colors.red,
              onPressed: () {
                LocalDatabase.deleteAllNotification();
              },
              icon: const Icon(Icons.delete),
            ),
            TextButton(
                onPressed: () {
                  NotificationApiService.sendNotificationToAll("my_news");
                },
                child: Text("All")),
            TextButton(
                onPressed: () async {
                  String fcmToken =
                      await FirebaseMessaging.instance.getToken() as String;
                  NotificationApiService.sendNotificationToUser(
                      fcmToken: fcmToken, message: "birkishilik message edi");
                },
                child: Text("Single")),
          ],
          iconTheme: const IconThemeData(color: Colors.blue),
          title: Text(
            tr('home_screen.notifications'),
            style: MyTextStyle.sfProSemiBold
                .copyWith(fontSize: 24, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state is LoadNotificationProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadNotificationSuccess) {
                return Column(
                  children: [
                    ...List.generate(state.notifications.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: notificationItem(
                            imgPath: "assets/images/confirmed.png",
                            title: state.notifications[index].title,
                            desc: state.notifications[index].body),
                      );
                    }),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          ContentIcons.appointment_empty,
                          color: MyColors.otherGradient1.first,
                          width: 250,
                          height: 240,
                        ),
                        Positioned(
                          left: 100,
                          bottom: 95,
                          child: SvgPicture.asset(
                            SocialIcons.sentimentDissatisfied,
                            color: Colors.white,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'You don`t have an notification',
                    style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 23.sp),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

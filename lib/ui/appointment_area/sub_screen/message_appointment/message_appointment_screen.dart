
import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/appointment_area/sub_screen/message_appointment/widgets/doctor_item.dart';
import 'package:doctor_app/ui/appointment_area/sub_screen/message_appointment/widgets/message_item.dart';
import 'package:doctor_app/ui/appointment_area/sub_screen/message_appointment/widgets/message_text_field.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/navigation/navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageAppointmentScreen extends StatelessWidget {
  const MessageAppointmentScreen({super.key, required this.model});
  final AppointmentModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "messaging",
        widget: InkWell(
          onTap: () {
            Navigator.pushNamed(
                context, callEndRoute,
                arguments: {'info': model});
          },
          child: Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: MyColors.primary.withOpacity(0.1),
            ),
            child: Center(
              child: SvgPicture.asset(NavigationIcons.moreVert,
                  color: MyColors.primary, width: 24.w, height: 24.h),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w).r,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: MyColors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: DoctorItem(
                        name: model.doctorName,
                        time: model.hour,
                        imgName: model.doctorImage),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 550.h,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    10,
                    (index) => const MessageItem(
                      isMe: false,
                    ),
                  ),
                ),
              ),
              const MessageTextField()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentsDetails extends StatelessWidget {
  const MyAppointmentsDetails({super.key, required this.model});
  final AppointmentModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          height: 9,
          color: MyColors.neutral8,
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          tr("my_appointments_detail_screen.visit_time"),
          style: MyTextStyle.sfProSemiBold.copyWith(
            fontSize: 18.sp,
            color: MyColors.neutral1,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          tr("book_appointment_screen.${model.amOrPm}"),
          style: MyTextStyle.sfProRegular.copyWith(
            fontSize: 16.sp,
            color: MyColors.neutralBlack,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Monday, March 27 2022",
          style: MyTextStyle.sfProRegular.copyWith(
            fontSize: 16.sp,
            color: MyColors.neutralBlack,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "${model.bookedHours}",
          style: MyTextStyle.sfProRegular.copyWith(
            fontSize: 16.sp,
            color: MyColors.neutralBlack,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h).r,
          child: const Divider(
            thickness: 1,
            color: MyColors.neutral8,
          ),
        ),
        Text(
          tr("my_appointments_detail_screen.patient_information"),
          style: MyTextStyle.sfProSemiBold.copyWith(
            fontSize: 18.sp,
            color: MyColors.neutral1,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "full_name : ${model.fullName}".tr(),
          style: MyTextStyle.sfProRegular.copyWith(
            fontSize: 16.sp,
            color: MyColors.neutralBlack,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Age : ${model.age}",
          style: MyTextStyle.sfProRegular.copyWith(
            fontSize: 16.sp,
            color: MyColors.neutralBlack,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Phone : ${model.phoneNumber}",
          style: MyTextStyle.sfProRegular.copyWith(
            fontSize: 16.sp,
            color: MyColors.neutralBlack,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h).r,
          child: const Divider(
            thickness: 1,
            color: MyColors.neutral8,
          ),
        ),
        Text(
          tr("my_appointments_detail_screen.free_information"),
          style: MyTextStyle.sfProSemiBold.copyWith(
            fontSize: 18.sp,
            color: MyColors.neutral1,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "\$ (Paid)",
          style: MyTextStyle.sfProSemiBold.copyWith(
            fontSize: 16.sp,
            color: MyColors.primary,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            model.type == "Messaging"
                ? Navigator.pushNamed(context, messageAppointmentRoute)
                : Navigator.pushNamed(context, callEndRoute,
                    arguments: {'info': model});
          },
          child: Container(
            width: 380.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              gradient: const LinearGradient(colors: MyColors.otherGradient1),
            ),
            child: Center(
              child: Text(
                model.type == "Messaging"
                    ? "Message Now (Start at ${model.hour})"
                    : "Voice Call Now (Start at ${model.hour})",
                style: MyTextStyle.sfProSemiBold
                    .copyWith(color: MyColors.white, fontSize: 18.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

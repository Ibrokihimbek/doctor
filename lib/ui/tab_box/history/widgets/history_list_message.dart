import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/date_format.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesHistoryList extends StatelessWidget {
  final VoidCallback onTap;
  final AppointmentModel appointmentModel;
  const MessagesHistoryList(
      {super.key, required this.onTap, required this.appointmentModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16).r,
      child: InkWell(
        borderRadius: BorderRadius.circular(24.r),
        onTap: onTap,
        child: Container(
          height: 115.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: MyColors.white,
            boxShadow: [
              BoxShadow(
                color: MyColors.primary.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(appointmentModel.doctorImage),
                  ),
                ),
                width: 60.w,
                height: 60.h,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13)
                          .r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointmentModel.doctorName,
                        style: MyTextStyle.sfProSemiBold.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      RichText(
                        text: TextSpan(
                          style: MyTextStyle.sfProRegular.copyWith(
                            fontSize: 12.sp,
                            color: MyColors.black,
                          ),
                          text: "Messaging - ",
                          children: [
                            TextSpan(
                              text: appointmentModel.status,
                              style: MyTextStyle.sfProRegular.copyWith(
                                fontSize: 12.sp,
                                color: appointmentModel.status == 'done'
                                    ? MyColors.success
                                    : MyColors.error,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        appointmentModel.hour,
                        style:
                            MyTextStyle.sfProSemiBold.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        TimeUtils.birthDate(
                            DateTime.parse(appointmentModel.createdAt)),
                        style:
                            MyTextStyle.sfProSemiBold.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

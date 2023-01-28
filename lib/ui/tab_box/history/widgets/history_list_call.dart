import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/widgets/custom_icon_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/date_format.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:doctor_app/utils/icons/navigation/navigation.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallHistoryList extends StatelessWidget {
  final AppointmentModel appointmentModel;
  const CallHistoryList({super.key, required this.appointmentModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16).r,
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
                image: DecorationImage(
                  image: NetworkImage(appointmentModel.doctorImage),
                  fit: BoxFit.cover,
                ),
              ),
              width: 100.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 81.h,
                    left: 67.w,
                    child: Image.asset(
                      AppIcons.callVoice,
                      width: 36.w,
                      height: 36.h,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 13).r,
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
                      text: "Voice Call - ",
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
                    style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    TimeUtils.birthDate(
                        DateTime.parse(appointmentModel.createdAt)),
                    style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20).r,
              child: CustomIconButton(
                iconPath: NavigationIcons.chevronRight,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pushNamed(context, historyCallDetailRoute);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

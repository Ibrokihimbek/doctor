import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/tab_box/appointment/widgets/image_with_stack.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/communication/communication.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentItemView extends StatelessWidget {
  const AppointmentItemView(
      {super.key, required this.isTrue, required this.model});

  final AppointmentModel model;
  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h).r,
      child: InkWell(
        onTap: () {
          isTrue
              ? Navigator.pushNamed(context, myAppointmentDetailRoute,
                  arguments: {'doctorInfo': model})
              : const SizedBox();
        },
        child: Container(
          padding: EdgeInsets.only(right: 20.w).r,
          width: 280.w,
          height: 110.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xff121212).withOpacity(0.12), blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(12.r),
            color: MyColors.neutralWhite,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageWithStack(
                    imgName: model.doctorImage,
                    type: model.type,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 13.h,
                      left: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.doctorName,
                          style: MyTextStyle.sfProSemiBold.copyWith(
                              color: MyColors.neutralBlack, fontSize: 16.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h).r,
                          child: Row(
                            children: [
                              Text(
                                model.type,
                                style: MyTextStyle.sfProRegular.copyWith(
                                    color: MyColors.neutralBlack,
                                    fontSize: 12.sp),
                              ),
                              Text(
                                "-  ${model.status}",
                                style: MyTextStyle.sfProRegular.copyWith(
                                    color: model.status == "scheduled"
                                        ? MyColors.statusinfo
                                        : (model.status == "completed"
                                            ? MyColors.success
                                            : MyColors.error),
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          model.hour,
                          style: MyTextStyle.sfProRegular.copyWith(
                              color: MyColors.neutralBlack, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  isTrue
                      ? (model.type == "Messaging"
                          ? Navigator.pushNamed(
                              context, messageAppointmentRoute,
                              arguments: {'info': model})
                          : Navigator.pushNamed(context, callEndRoute,
                              arguments: {'info': model}))
                      : const SizedBox();
                },
                child: Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: MyColors.primary.withOpacity(0.1),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                        model.type == "Messaging"
                            ? CommunicationIcons.chat
                            : CommunicationIcons.call,
                        color: MyColors.primary,
                        width: 24.w,
                        height: 24.h),
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

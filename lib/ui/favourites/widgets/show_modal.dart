import 'package:doctor_app/bloc/user/user_bloc.dart';
import 'package:doctor_app/data/models/doctor/doctor_model.dart';
import 'package:doctor_app/data/models/users/user_model.dart';
import 'package:doctor_app/ui/widgets/doctor_card_item.dart';
import 'package:doctor_app/ui/widgets/global_button.dart';
import 'package:doctor_app/ui/widgets/global_button_outline.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showBottomsheet(context, DoctorModel doctor, UserModel userModel) {
  showModalBottomSheet(
    isDismissible: false,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(37.r),
        topRight: Radius.circular(37.r),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: 336.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 32.h),
            DoctorCardItem(
                image: doctor.doctorImage,
                doctorName: doctor.doctorName,
                rating: doctor.rating.toDouble(),
                reviewsCount: doctor.patientCount,
                cardioSpecialist: doctor.specialityName,
                isOutlined: true),
            SizedBox(height: 24.h),
            Text(
              "Remove from favorite?",
              style: MyTextStyle.sfProRegular.copyWith(
                  color: MyColors.neutral1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 36.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 184.w,
                      child: GlobalButtonOutline(
                          buttonText: "Cancel",
                          onTap: () {
                            Navigator.pop(context);
                          })),
                  SizedBox(
                    width: 184.w,
                    child: GlobalButton(
                        isActive: true,
                        buttonText: "Yes, Remove",
                        onTap: () {
                          userModel.favorites.remove(doctor.doctorId);
                          BlocProvider.of<UserBloc>(context)
                              .updateUserInfo(userModel);
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

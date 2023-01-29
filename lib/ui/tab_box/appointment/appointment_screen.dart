import 'package:doctor_app/bloc/get_appointements_cubit/get_appointments_bloc.dart';
import 'package:doctor_app/bloc/get_appointements_cubit/user_appointments_state.dart';
import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/tab_box/appointment/widgets/past_appointments_items.dart';
import 'package:doctor_app/ui/tab_box/appointment/widgets/upcoming_appointments_items.dart';
import 'package:doctor_app/ui/widgets/appbar_by_logo.dart';
import 'package:doctor_app/ui/widgets/custom_icon_button.dart';
import 'package:doctor_app/ui/widgets/search_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/icons/file/file.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int pageIndex = 0;
  List<String> listItem = [
    "Upcoming",
    "Past",
  ];
  String isChanged = '';
  String isChangedOther = '';
  List<AppointmentModel> scheduled = [];
  List<AppointmentModel> other = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAppointmentsCubit, UserAppointmentsState>(
      builder: (context, state) {
        if (state is LoadGetAppointmentsInSuccess) {
          return KeyboardDismisser(
            child: Scaffold(
              appBar: AppbarByLogo(
                yesLogo: false,
                logo: FileIcons.logo,
                title: 'My Appointments',
                rightLogo: ContentIcons.addCircleOutline,
                onAddTap: () {},
              ),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: MyColors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SearchTextField(
                            valueChange: (value) {
                              if (pageIndex == 0) {
                                isChanged = value;
                                scheduled = state.appointmentModel
                                    .where(
                                      (element) => element.doctorName
                                          .toLowerCase()
                                          .startsWith(
                                            value.toString().toLowerCase(),
                                          ),
                                    )
                                    .toList();
                                setState(
                                  () {
                                    scheduled = scheduled
                                        .where((element) =>
                                            element.status == 'scheduled')
                                        .toList();
                                  },
                                );
                              } else {
                                isChangedOther = value;
                                other = state.appointmentModel
                                    .where(
                                      (element) => element.doctorName
                                          .toLowerCase()
                                          .startsWith(
                                            value.toString().toLowerCase(),
                                          ),
                                    )
                                    .toList();
                                setState(
                                  () {
                                    other = other
                                        .where((element) =>
                                            element.status != 'scheduled')
                                        .toList();
                                  },
                                );
                              }
                            },
                          ),
                          CustomIconButton(
                            iconPath: ContentIcons.filterList,
                            onTap: () {},
                          )
                        ],
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          2,
                          (index) => InkWell(
                            borderRadius: BorderRadius.circular(24.r),
                            onTap: () {
                              setState(() {
                                FocusManager.instance.primaryFocus?.unfocus();
                                pageIndex = index;
                              });
                            },
                            child: Container(
                              height: 43.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff121212)
                                        .withOpacity(0.12),
                                    blurRadius: 12.r,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24.r),
                                color: pageIndex == index
                                    ? MyColors.actionPrimaryDefault
                                    : MyColors.actionPrimaryInverted,
                              ),
                              child: Center(
                                child: Text(
                                  listItem[index],
                                  style: MyTextStyle.sfProRegular.copyWith(
                                      fontSize: 18.sp,
                                      color: pageIndex == index
                                          ? MyColors.actionPrimaryInverted
                                          : MyColors.actionPrimaryDefault),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: pageIndex == 0
                            ? UpcomingAppointmentsItems(
                                appointments: isChanged.isNotEmpty
                                    ? scheduled
                                    : state.appointmentModel
                                        .where((element) =>
                                            element.status == 'scheduled')
                                        .toList(),
                              )
                            : (PastAppointmentItems(
                                appointments: isChangedOther.isNotEmpty
                                    ? other
                                    : state.appointmentModel
                                        .where((element) =>
                                            element.status != 'scheduled')
                                        .toList(),
                              )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

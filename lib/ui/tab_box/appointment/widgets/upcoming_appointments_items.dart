import 'package:doctor_app/bloc/get_appointements_cubit/get_appointments_bloc.dart';
import 'package:doctor_app/bloc/get_appointements_cubit/user_appointments_state.dart';
import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/tab_box/appointment/widgets/appointment_item_view.dart';
import 'package:doctor_app/ui/tab_box/appointment/widgets/when_no_data.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/my_utils.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UpcomingAppointmentsItems extends StatelessWidget {
  const UpcomingAppointmentsItems({super.key});

  @override
  Widget build(BuildContext context) {
    String name='';
    List <AppointmentModel> apModelSearch=[];
    return BlocConsumer<GetAppointmentsCubit, UserAppointmentsState>(
      listener: (context, state) {
        if (state is LoadGetAppointmentsInProgress) {
          MyUtils.getMyToast(message: "Loading in progress...");
        }
      },
      builder: (context, state) {
        if (state is InitialGetAppointments) {
          return const MessNoDataScreen();
        } else if (state is LoadGetAppointmentsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadGetAppointmentsInSuccess) {
          return state.appointmentModel.length > 1
              ? ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h).r,
                          child: Text(
                            DateFormat.yMMMMEEEEd()
                                .format(DateTime.now())
                                .toString(),
                            style: MyTextStyle.sfProRegular.copyWith(
                                color: MyColors.neutral1, fontSize: 16),
                          ),
                        ),
                        ...List.generate(
                          state.appointmentModel.length,
                          (index) => Row(
                            children: [
                              Expanded(
                                child: AppointmentItemView(
                                  model: state.appointmentModel[index],
                                  isTrue: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h).r,
                            child: Text(
                              DateFormat.yMMMMEEEEd()
                                  .format(DateTime.now())
                                  .toString(),
                              style: MyTextStyle.sfProRegular.copyWith(
                                  color: MyColors.neutral1, fontSize: 16),
                            ),
                          ),
                          ...List.generate(
                            state.appointmentModel.length,
                            (index) => Row(
                              children: [
                                Expanded(
                                  child: AppointmentItemView(
                                    model: state.appointmentModel[index],
                                    isTrue: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 80.h),
                        ])
                  ],
                )
              : MessNoDataScreen();
        } else if (state is LoadGetAppointmentsInFailure) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

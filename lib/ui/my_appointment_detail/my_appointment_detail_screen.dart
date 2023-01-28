import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/my_appointment_detail/widgets/my_appointment_detail_items.dart';
import 'package:doctor_app/ui/tab_box/appointment/widgets/appointment_item_view.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/ui/widgets/doctor_stats.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentDetailScreen extends StatefulWidget {
  const MyAppointmentDetailScreen({super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;
  @override
  State<MyAppointmentDetailScreen> createState() =>
      _MyAppointmentDetailScreenState();
}

class _MyAppointmentDetailScreenState extends State<MyAppointmentDetailScreen> {
  AppointmentModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: tr("appointment_screen.my_appointments"),
        widget: const SizedBox(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w).r,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: MyColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                  child: AppointmentItemView(
                    model: widget.appointmentModel,
                    isTrue: false,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 24.h).r,
              child: const DoctorStats(
                  patients: "500+", yearsExperiences: "15+", reviews: "3800+"),
            ),
            MyAppointmentsDetails(
              model: widget.appointmentModel,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/tab_box/history/widgets/history_list_call.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceCallItem extends StatelessWidget {
  final List<AppointmentModel> appointments;
  const VoiceCallItem({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              appointments.length,
              (index) => CallHistoryList(
                appointmentModel: appointments[index],
              ),
            ),
            SizedBox(height: 80.h),
          ],
        ),
      ],
    );
  }
}

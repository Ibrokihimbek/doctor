import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/widgets/global_button.dart';
import 'package:doctor_app/ui/widgets/global_button_outline.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';

class CallEndScreen extends StatelessWidget {
  const CallEndScreen({super.key, required this.model});
  final AppointmentModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          model.type=="Call"? const Text('Voice Call Ended'):const Text('Messaging Ended'),
          const SizedBox(height: 10),
          Text(
            '30:00 Minutes',
            style: MyTextStyle.sfProSemiBold
                .copyWith(color: MyColors.primary, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Text('Recordings have been saved in history'),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(model.doctorImage), fit: BoxFit.contain),
            ),
            alignment: Alignment.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Dr. ${model.doctorName}',
            style: MyTextStyle.sfProBold.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: GlobalButton(
              buttonText: 'Write a Review',
              onTap: () {
                Navigator.pushNamed(context, addReviewRoute,
                    arguments: {'infoModel': model});
              },
              isActive: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: GlobalButtonOutline(
              buttonText: 'Go to Dashboard',
              onTap: () {
                Navigator.pushNamed(context, myAppointmentDetailRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}

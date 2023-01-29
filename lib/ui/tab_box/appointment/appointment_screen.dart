import 'package:doctor_app/ui/tab_box/appointment/widgets/filter_button.dart';
import 'package:doctor_app/ui/tab_box/appointment/widgets/past_appointments_items.dart';
import 'package:doctor_app/ui/tab_box/appointment/widgets/upcoming_appointments_items.dart';
import 'package:doctor_app/ui/widgets/appbar_by_logo.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/icons/file/file.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int pageIndex = 0;
  List<String> listItem = [
    "upcoming",
    "past",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarByLogo(
        yesLogo: false,
        logo: FileIcons.logo,
        title: 'Mening Uchrashuvlarim',
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
              const FilterButton(),
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
                        pageIndex = index;
                      });
                    },
                    child: Container(
                      height: 43.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff121212).withOpacity(0.12),
                              blurRadius: 12)
                        ],
                        borderRadius: BorderRadius.circular(24.r),
                        color: pageIndex == index
                            ? MyColors.actionPrimaryDefault
                            : MyColors.actionPrimaryInverted,
                      ),
                      child: Center(
                        child: Text(
                          tr('appointment_screen.${listItem[index]}'),
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
                    ? const UpcomingAppointmentsItems()
                    : (const PastAppointmentItems()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

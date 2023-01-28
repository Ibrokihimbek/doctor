import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_bloc.dart';
import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_event.dart';
import 'package:doctor_app/ui/book_appointment/sub_screens/WidgetAppointment/free_information_widget.dart';
import 'package:doctor_app/ui/book_appointment/sub_screens/WidgetAppointment/morning_and_evening_widget.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/ui/widgets/global_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/communication/communication.dart';
import 'package:doctor_app/utils/icons/image/image.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointmentScreen extends StatefulWidget {
  final int selected;
  final List workday;

  const BookAppointmentScreen({
    Key? key,
    required this.selected,
    required this.workday,
  }) : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int selectMorningOrEvening = 2;
  int selectedGridView = 50;
  int selectedList = 2;

  @override
  Widget build(BuildContext context) {
    List infoIcons = [
      CommunicationIcons.chat,
      CommunicationIcons.call,
    ];
    List<String> infoNames = [
      "messaging",
      "voice_call",
    ];
    List<String> infoDescriptions = [
      "can_messaging_with_doctor",
      "can_make_a_voice_call_with_doctor",
    ];
    List<String> infoPrice = [
      " 5",
      "10",
    ];
    List<String> morningName = [
      "morning",
      "evening",
    ];
    List morningIcon = [ImageIcons.wbSunny, ImageIcons.wbIncandescent];

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: CustomAppBar(
        title: tr("global.book_appointment"),
        widget: const SizedBox(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w).r,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    textItem(
                      DateFormat.yMMMMEEEEd().format(
                        DateTime.fromMillisecondsSinceEpoch(
                          DateTime.now().millisecondsSinceEpoch +
                              (widget.selected) * 86400000,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectMorningOrEvening = index;
                                });
                              },
                              child: MorningAndEvening(
                                icon: morningIcon[index],
                                text: morningName[index],
                                containerColor: selectMorningOrEvening == index
                                    ? MyColors.actionPrimaryDefault
                                    : MyColors.white,
                                textColor: selectMorningOrEvening == index
                                    ? MyColors.white
                                    : MyColors.actionPrimaryDefault,
                                sunColor: selectMorningOrEvening == index
                                    ? MyColors.white
                                    : MyColors.actionPrimaryDefault,
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 30.h),
                    textItem("choose_the_hour"),
                    Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                        widget.workday.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGridView = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10)
                                  .w,
                              child: Container(
                                width: 100.w,
                                height: 40.h,
                                margin:
                                    const EdgeInsets.only(right: 5, left: 5).r,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2.w,
                                      color: MyColors.actionPrimaryDefault,
                                    ),
                                    borderRadius: BorderRadius.circular(25).w,
                                    color: index == selectedGridView
                                        ? MyColors.actionPrimaryDefault
                                        : MyColors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.workday[index],
                                      style: MyTextStyle.sfBold800.copyWith(
                                        color: index == selectedGridView
                                            ? MyColors.white
                                            : MyColors.actionPrimaryDefault,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    textItem("free_information"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedList = index;
                              });
                            },
                            child: FreeInformationWidget(
                              icon: infoIcons[index],
                              name: infoNames[index],
                              description: infoDescriptions[index],
                              price: infoPrice[index],
                              colorCon: index == selectedList
                                  ? MyColors.actionPrimaryDefault
                                  : MyColors.white,
                              colorIcon: index == selectedList
                                  ? MyColors.white
                                  : MyColors.primary.withOpacity(0.1),
                              colorPrice: index == selectedList
                                  ? MyColors.white
                                  : MyColors.actionPrimaryDefault,
                              colorDescription: index == selectedList
                                  ? MyColors.white
                                  : MyColors.actionNeutralDisabled,
                              colorText: index == selectedList
                                  ? MyColors.white
                                  : MyColors.black,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.8),
                  GlobalButton(
                    buttonText: "next",
                    isActive: checkNext(
                        selectMorningOrEvening, selectedGridView, selectedList),
                    onTap: (() {
                      if (checkNext(selectMorningOrEvening, selectedGridView,
                          selectedList)) {
                        BlocProvider.of<SingleAppointmentsBloc>(context).add(
                          UpdateBookAppointmentScreen(
                              amOrPm: morningName[selectMorningOrEvening],
                              hour: "ffgdf", //widget.workday[selectedGridView],
                              type: infoNames[selectedList]),
                        );
                      }
                    }),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.8),
                  GlobalButton(
                    buttonText: "next",
                    isActive: checkNext(
                        selectMorningOrEvening, selectedGridView, selectedList),
                    onTap: (() {
                      if (checkNext(selectMorningOrEvening, selectedGridView,
                          selectedList)) {
                        BlocProvider.of<SingleAppointmentsBloc>(context).add(
                          UpdateBookAppointmentScreen(
                              amOrPm: morningName[selectMorningOrEvening],
                              hour: widget.workday[selectedGridView],
                              type: infoNames[selectedList]),
                        );
                      }
                      Navigator.pushNamed(context, bookPatientDetailsRoute);
                    }),
                    isSmall: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkNext(int numDay, int numTime, int numCall) {
    if (numDay == 2 || numTime == 9 || numCall == 2) {
      return false;
    } else {
      return true;
    }
  }

  Row textItem(String text) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5, bottom: 15).r,
          child: Text(
            tr('book_appointment_screen.$text'),
            style: MyTextStyle.sfProSemiBold.copyWith(
              color: MyColors.black,
            ),
          ),
        ),
      ],
    );
  }
}

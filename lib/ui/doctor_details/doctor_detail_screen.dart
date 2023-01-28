import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_bloc.dart';
import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_event.dart';
import 'package:doctor_app/bloc/reviews/reviews_bloc.dart';
import 'package:doctor_app/bloc/reviews/reviews_state.dart';
import 'package:doctor_app/data/models/doctor/doctor_model.dart';
import 'package:doctor_app/data/models/review/review_model.dart';
import 'package:doctor_app/data/repositories/storage_repository.dart';
import 'package:doctor_app/ui/doctor_details/widgets/calendar_container.dart';
import 'package:doctor_app/ui/doctor_details/widgets/container_items.dart';
import 'package:doctor_app/ui/doctor_details/widgets/custom_text.dart';
import 'package:doctor_app/ui/doctor_details/widgets/custom_text_bold.dart';
import 'package:doctor_app/ui/doctor_details/widgets/cutom_row_text.dart';
import 'package:doctor_app/ui/doctor_details/widgets/share_button.dart';
import 'package:doctor_app/ui/widgets/doctorItems.dart';
import 'package:doctor_app/ui/widgets/double_icons_appbar.dart';
import 'package:doctor_app/ui/widgets/global_button.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:doctor_app/utils/icons/image/image.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailScreen extends StatefulWidget {
  final DoctorModel doctorModel;

  const DoctorDetailScreen({
    Key? key,
    required this.doctorModel,
  }) : super(key: key);

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

bool isLiked = false;
int selectedDay = 8;

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: DoubleIconsAppBar(
        title: "Dr. ${widget.doctorModel.doctorName}",
        onRightTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: const Radius.circular(30).r,
              ),
            ),
            builder: (BuildContext context) {
              return SizedBox(
                height: 325.h,
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Container(
                      width: 38.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100).r,
                        color: MyColors.neutral7,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      tr('doctor_details_screen.share'),
                      style: MyTextStyle.sfProBold.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: MyColors.neutral1,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        ShareButton(
                            image: ImageIcons.whatsapp, name: "WhatsApp"),
                        ShareButton(image: ImageIcons.twitter, name: "Twitter"),
                        ShareButton(
                            image: ImageIcons.facebook, name: "Facebook"),
                        ShareButton(
                            image: ImageIcons.instagram, name: "Instagram"),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                ShareButton(
                                    image: ImageIcons.yahoo, name: "Yahoo"),
                                ShareButton(
                                    image: ImageIcons.tiktok, name: "Twitter"),
                                ShareButton(
                                    image: ImageIcons.chat, name: "Chat"),
                                ShareButton(
                                    image: ImageIcons.wechat, name: "WeChat"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        rightIcon: SocialIcons.share,
        onLeftTap: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
        leftIcon: isLiked ? ActionIcons.favoriteBorder : ActionIcons.favorite,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<ReviewsBloc, ReviewsState>(
              builder: (context, state) {
                if (state is LoadReviewsInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LoadReviewsInSuccess) {
                  List<ReviewModel> reviews = state.reviews
                      .where((element) =>
                          element.doctorId == widget.doctorModel.doctorId)
                      .toList();
                  return Column(
                    children: [
                      ContainerItems(
                        image: widget.doctorModel.doctorImage,
                        doctorName: widget.doctorModel.doctorName,
                        reviewsCount: widget.doctorModel.experience,
                        cardioSpecialist: widget.doctorModel.specialityName,
                        rating: widget.doctorModel.rating,
                      ),
                      SizedBox(height: 24.h),
                      DoctorItems(
                        patients: "${widget.doctorModel.patientCount}+",
                        yearsExperiences: "${widget.doctorModel.experience}+",
                        reviews: "${checkReviews(reviews.length)}+",
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24).w,
                        child: Column(
                          children: [
                            const CustomRowText(text: "about_doctor"),
                            SizedBox(height: 8.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: widget.doctorModel.aboutDoctor),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            const CustomRowText(text: "working_time"),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CustomText(
                                    text: "Mon - Fri, 09.00 AM - 20.00 PM"),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextBold(
                                  text: "reviews",
                                  color: MyColors.neutral1,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      reviewsRoute,
                                      arguments: {"reviews": reviews},
                                    );
                                  },
                                  child: const CustomTextBold(
                                    text: "see_reviews",
                                    color: MyColors.actionPrimaryDefault,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            const CustomRowText(text: "make_appointment"),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 88.h,
                        child: ListView.builder(
                          itemCount: 7,
                          padding: const EdgeInsets.only(left: 24, right: 12).r,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDay = index;
                                });
                              },
                              child: CalendarContainer(
                                select: selectedDay == index ? true : false,
                                week: DateFormat.E().format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        DateTime.now().millisecondsSinceEpoch +
                                            (index) * 86400000)),
                                date: DateTime.fromMillisecondsSinceEpoch(
                                        DateTime.now().millisecondsSinceEpoch +
                                            (index) * 86400000)
                                    .day,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  );
                }
                if (state is LoadReviewsInFailure) {
                  return Center(child: Text(state.error));
                }
                return const SizedBox();
              },
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24).w,
                child: GlobalButton(
                  isActive: checkActiv(selectedDay),
                  buttonText: "book_appointment",
                  onTap: () async {
                    var uid = await StorageRepository.getUserId();
                    if (checkActiv(selectedDay)) {
                      // ignore: use_build_context_synchronously
                      BlocProvider.of<SingleAppointmentsBloc>(context).add(
                        UpdateDoctorDetailsScreen(
                          doctorImage: widget.doctorModel.doctorImage,
                          doctorId: widget.doctorModel.doctorId,
                          weekData: "${DateFormat.E().format(
                            DateTime.fromMillisecondsSinceEpoch(
                              DateTime.now().millisecondsSinceEpoch +
                                  (selectedDay) * 86400000,
                            ),
                          )} ${DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + (selectedDay) * 86400000).day}",
                          doctorName: widget.doctorModel.doctorName,
                          userid: uid.toString(),
                        ),
                      );
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(
                      context,
                      bookAppointmentRoute,
                      arguments: {
                        'workday': checkDay(),
                        'selected': selectedDay,
                      },
                    );
                    selectedDay = 8;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  checkActiv(int selectIndex) {
    if (selectIndex == 8) {
      return false;
    }
    return true;
  }

  checkDay() {
    String dayWeek = DateFormat.EEEE()
        .format(
          DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch + (selectedDay) * 86400000,
          ),
        )
        .toString()
        .toLowerCase();
    switch (dayWeek) {
      case "monday":
        return widget.doctorModel.workingTime.monday;
      case "tuesday":
        return widget.doctorModel.workingTime.tuesday;
      case "wednesday":
        return widget.doctorModel.workingTime.wednesday;
      case "thursday":
        return widget.doctorModel.workingTime.thursday;
      case "friday":
        return widget.doctorModel.workingTime.friday;
      case "saturday":
        return widget.doctorModel.workingTime.saturday;
      case "sunday":
        return widget.doctorModel.workingTime.sunday;
      case "понедельник":
        return widget.doctorModel.workingTime.monday;
      case "вторник":
        return widget.doctorModel.workingTime.tuesday;
      case "среда":
        return widget.doctorModel.workingTime.wednesday;
      case "четверг":
        return widget.doctorModel.workingTime.thursday;
      case "пятница":
        return widget.doctorModel.workingTime.friday;
      case "суббота":
        return widget.doctorModel.workingTime.saturday;
      case "воскресенье":
        return widget.doctorModel.workingTime.sunday;
    }
  }
}

String checkReviews(int reviewsCount) {
  num a = 0;
  num b = 0;
  if (reviewsCount >= 5) {
    if (reviewsCount >= 10) {
      if (reviewsCount >= 100) {
        if (reviewsCount >= 1000) {
          a = reviewsCount % 1000;
          b = reviewsCount - a;
          return b.toString();
        } else {
          a = reviewsCount % 100;
          b = reviewsCount - a;
          return b.toString();
        }
      } else {
        a = reviewsCount % 10;
        b = reviewsCount - a;
        return b.toString();
      }
    } else {
      a = reviewsCount % 5;
      b = reviewsCount - a;
      return b.toString();
    }
  } else {
    return 0.toString();
  }
}

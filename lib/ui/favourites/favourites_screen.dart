import 'dart:math';

import 'package:doctor_app/bloc/doctors/doctors_bloc.dart';
import 'package:doctor_app/bloc/doctors/doctors_state.dart';
import 'package:doctor_app/bloc/user/user_bloc.dart';
import 'package:doctor_app/data/models/doctor/doctor_model.dart';
import 'package:doctor_app/ui/favourites/widgets/show_modal.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/ui/widgets/doctor_card_item.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/content/content.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:doctor_app/utils/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: tr("home_screen.favorite_doctor"),
        widget: InkWell(
          onTap: () {},
          child: Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: const Color(0xFF2972FE).withOpacity(0.1),
            ),
            child: Center(
              child: SvgPicture.asset(ContentIcons.filterList,
                  height: 24.h, width: 24.w, color: MyColors.primary),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UserBloc, UserSingleState>(
          builder: (context, stateUser) {
            return BlocBuilder<DoctorsBloc, DoctorsState>(
              builder: (context, state) {
                if (state is LoadDoctorInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LoadDoctorInSuccess) {
                  List<DoctorModel> doctors = [];
                  for (var element in state.doctors) {
                    if (stateUser.userModel.favorites.contains(element.doctorId)) {
                      doctors.add(element);
                    }
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.only(left: 24),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 12.w,
                      );
                    },
                    itemCount: state.doctors.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return DoctorCardItem(
                            onFavouriteTap: () =>
                                showBottomsheet(context, doctors[index], stateUser.userModel),
                            image: doctors[index].doctorImage,
                            doctorName: doctors[index].doctorName,
                            rating: doctors[index].rating.toDouble(),
                            reviewsCount: doctors[index].experience.toInt(),
                            cardioSpecialist: doctors[index].specialityName,
                            isOutlined: true,
                          );
                        },
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}

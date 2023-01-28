import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/bloc/doctors/doctors_state.dart';
import 'package:doctor_app/data/models/doctor/doctor_model.dart';
import 'package:doctor_app/data/repositories/search_doctors_repository.dart';
import 'package:doctor_app/ui/doctors_search/cubit/doctors_search_cubit.dart';
import 'package:doctor_app/ui/doctors_search/widgets/category_item.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/ui/widgets/doctor_card_item.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/my_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopDoctorsScreen extends StatelessWidget {
  const TopDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorsSearchCubit>(
      create: (context) => DoctorsSearchCubit(DoctorSearchRepository(
          firebaseFirestore: FirebaseFirestore.instance)),
      child: Scaffold(
        appBar: CustomAppBar(
          title:  tr('home_screen.top_doctor'),
          widget: Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
             // color: const Color(0xFF2972FE).withOpacity(0.1),
            ),
            child: Center(
              child: SvgPicture.asset(ContentIcons.filterList,
                  height: 24.h, width: 24.w, color: MyColors.primary),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        //  color: MyColors.white,
          child: BlocConsumer<DoctorsSearchCubit, DoctorsSearchState>(
            listenWhen: (previous, current) =>
                current is LoadDoctorsSearchProgress,
            builder: (context, state) {
              if (state is DoctorsSearchInitial) {
                return const Text("Hali data yo'q");
              } else if (state is LoadDoctorsSearchProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadDoctorsSearchSuccess) {
                List<DoctorModel> doctors = state.doctors;
        
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CategoryItem(),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          return DoctorCardItem(
                              onTap: () {
                                Navigator.pushNamed(context, doctorDetailRoute,
                                    arguments: state.doctors[index]);
                              },
                              image: doctors[index].doctorImage,
                              doctorName: doctors[index].doctorName,
                              rating: doctors[index].rating.toDouble(),
                              reviewsCount: doctors[index].patientCount,
                              cardioSpecialist: doctors[index].specialityName,
                              isOutlined: true);
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
            listener: (context, state) {
              if (state is LoadDoctorInProgress) {
                MyUtils.getMyToast(message: "Loading in progress...");
              } else if (state is LoadDoctorInSuccess) {
                MyUtils.getMyToast(message: "Success data");
              }
            },
          ),
        ),
      ),
    );
  }
}

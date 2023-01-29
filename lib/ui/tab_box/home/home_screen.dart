import 'package:doctor_app/bloc/doctors/doctors_bloc.dart';
import 'package:doctor_app/bloc/doctors/doctors_state.dart';
import 'package:doctor_app/cubits/speciality/speciality_cubit.dart';
import 'package:doctor_app/ui/doctors_search/cubit/doctors_search_cubit.dart';
import 'package:doctor_app/ui/router.dart';
import 'package:doctor_app/ui/tab_box/home/widgets/home_appbar.dart';
import 'package:doctor_app/ui/tab_box/home/widgets/specialist_item2.dart';
import 'package:doctor_app/ui/tab_box/home/widgets/top_doctors_data.dart';
import 'package:doctor_app/ui/top_doctors/top_doctors_screen.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/file/file.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppbar(
        logo: FileIcons.logo,
        title: "Shifo Top",
        onNotificationTap: () {
          Navigator.pushNamed(context, notificationRoute);
        },
      ),
      body: Container(
        // color: MyColors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 30.h).r,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w).r,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: () {
                  Navigator.pushNamed(context, doctorsSearchRoute);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.h).r,
                  height: 45.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.grey[100]),
                  child: Row(
                    children: [
                    const  Text("search",style: TextStyle(color: Colors.grey),),
                      const Spacer(),
                      Icon(
                        Icons.search,
                        color: Colors.grey[400],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w).r,
              child: Row(
                children: [
                  Text(
                    'All categories',
                    style: MyTextStyle.sfProSemiBold
                        .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                  decoration: const BoxDecoration(),
                  height: 610.h,
                  child: BlocBuilder<SpecialityCubit, SpecialityState>(
                    builder: (context, state) {
                      if (state is SpecialityInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is SpecialitySuccess) {
                        return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.specialistModel.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2.0)
                                        .r,
                                child: GestureDetector(
                                  onTap: () {
                                    debugPrint(state.specialistModel[index].id);
                                    Navigator.pushNamed(context, specialDoctor,
                                        arguments:
                                          {
                                          'specialistId':
                                              state.specialistModel[index].id,
                                            'specialName': state.specialistModel[index].title,

                                          },
                                        );
                                  },
                                  child: Specialist(
                                      color:
                                          "0xFF${state.specialistModel[index].color}",
                                      imgUrl:
                                          state.specialistModel[index].iconPath,
                                      name: state.specialistModel[index].title,
                                      numbers: state
                                          .specialistModel[index].doctorsCount
                                          .toString()),
                                ),
                              );
                            });
                      }
                      return const SizedBox();
                    },
                  )),
            ),
            // SizedBox(height: 24.h),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 24.w).r,
            //   child: Row(
            //     children: [
            //       Text(
            //         tr('home_screen.top_doctor'),
            //         style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 20.sp),
            //       ),
            //       const Spacer(),
            //       InkWell(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (_) => const TopDoctorsScreen()));
            //         },
            //         child: Text(
            //            tr('home_screen.see_all'),
            //           style: const TextStyle(color: Colors.blue),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20.h),
            // Container(
            //     decoration: const BoxDecoration(),
            //     height: 210.h,
            //     child: BlocBuilder<DoctorsBloc, DoctorsState>(
            //       builder: (context, state) {
            //         if (state is LoadDoctorInProgress) {
            //           return const Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         }
            //         if (state is LoadDoctorInSuccess) {
            //           return ListView.separated(
            //             physics: const BouncingScrollPhysics(),
            //             padding: EdgeInsets.only(left: 24.w, right: 24.w).r,
            //             separatorBuilder: (context, index) {
            //               return SizedBox(
            //                 width: 12.w,
            //               );
            //             },
            //             itemCount: state.doctors.length,
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context, index) {
            //               return TopDoctors(
            //                   onTap: () {
            //                     Navigator.pushNamed(context, doctorDetailRoute,
            //                         arguments: state.doctors[index]);
            //                   },
            //                   imgUrl: state.doctors[index].doctorImage,
            //                   name: state.doctors[index].doctorName,
            //                   specialist: state.doctors[index].specialityName);
            //             },
            //           );
            //         }
            //         return const SizedBox();
            //       },
            //     )),
            // SizedBox(height: 20.h),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 24.w).r,
            //   child: Row(
            //     children: [
            //       Text(
            //         tr('home_screen.recomended_doctor'),
            //         style: MyTextStyle.sfProSemiBold.copyWith(fontSize: 20.sp),
            //       ),
            //       const Spacer(),
            //       Text(
            //          tr('home_screen.see_all'),
            //         style: const TextStyle(color: Colors.blue),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

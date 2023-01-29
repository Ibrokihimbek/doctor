import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/bloc/doctors/doctors_state.dart';
import 'package:doctor_app/data/models/doctor/doctor_model.dart';
import 'package:doctor_app/data/repositories/doctors_repository.dart';
import 'package:doctor_app/data/repositories/search_doctors_repository.dart';
import 'package:doctor_app/ui/doctors_search/cubit/doctors_search_cubit.dart';
import 'package:doctor_app/ui/doctors_search/widgets/category_item.dart';
import 'package:doctor_app/ui/doctors_search/widgets/searchNametextField.dart';
import 'package:doctor_app/ui/widgets/doctor_card_item.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsSearchScreen extends StatefulWidget {
  const DoctorsSearchScreen({super.key});

  @override
  State<DoctorsSearchScreen> createState() => _DoctorsSearchScreenState();
}

class _DoctorsSearchScreenState extends State<DoctorsSearchScreen> {
  String name = '';
  List<DoctorModel> showDoctors = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsSearchCubit, DoctorsSearchState>(
      listenWhen: (previous, current) => current is LoadDoctorsSearchProgress,
      builder: (context, state) {
        if (state is DoctorsSearchInitial) {
          return const Text("Hali data yo'q");
        } else if (state is LoadDoctorsSearchProgress) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoadDoctorsSearchSuccess) {
          List<DoctorModel> doctors = state.doctors;

          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                bottomOpacity: 0,
                shadowColor: Colors.white,
                backgroundColor: Colors.white,
                leading: ShaderMask(
                  shaderCallback: (bounds) =>
                      const LinearGradient(colors: MyColors.specialistGradient2)
                          .createShader(bounds),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                title: SearchNameTextField(
                  onChanged: (value) {
                    name = value;
                    setState(() {
                      value.isNotEmpty
                          ? showDoctors = doctors
                              .where((element) => element.doctorName
                                  .toLowerCase()
                                  .startsWith(value.toString().toLowerCase()))
                              .toList()
                          : showDoctors = doctors;
                    });
                  },
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CategoryItem(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          name.isEmpty ? doctors.length : showDoctors.length,
                      itemBuilder: (context, index) {
                        showDoctors = name.isEmpty ? doctors : showDoctors;
                        return DoctorCardItem(
                          onTap: () {
                            Navigator.pushNamed(context, doctorDetailRoute,
                                arguments: showDoctors[index]);
                          },
                          image: showDoctors[index].doctorImage,
                          doctorName: showDoctors[index].doctorName,
                          rating: showDoctors[index].rating.toDouble(),
                          reviewsCount: showDoctors[index].patientCount,
                          cardioSpecialist: showDoctors[index].specialityName,
                          isOutlined: true,
                        );
                      },
                    ),
                  ],
                ),
              ));
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
    );
  }
}

import 'package:doctor_app/data/repositories/speciality_repository.dart';
import 'package:doctor_app/ui/notification/widgets/notification_item.dart';
import 'package:doctor_app/ui/specialist_deatil_doctor/cubit/detail_cubit.dart';
import 'package:doctor_app/ui/specialist_deatil_doctor/cubit/detail_state.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SpecialistDetailScreen extends StatelessWidget {
  const SpecialistDetailScreen({Key? key, required this.specialistId, required this.specialName}) : super(key: key);
  final String specialistId;
  final String specialName;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>
          SpecialDetailCubit(
              specialityRepository:
              context.read<SpecialityRepository>()
          )..getSingleSpecial(id: specialistId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:  CustomAppBar(
          title: specialistId,
          widget: const SizedBox(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<SpecialDetailCubit,SpecialDetailState>(builder: (context,state){
            if(state is LoadInProgress){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is LoadInSuccess){
              return  Column(
                children: [
                  ...List.generate(state.doctors.length, (index) {
                    var item = state.doctors[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, doctorDetailRoute,
                              arguments: state.doctors[index]);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 120.h,
                          decoration: BoxDecoration(
                              color:  Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff121212).withOpacity(0.07),
                                blurRadius: 16,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.r)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0).r,
                                child: Container(
                                  width: 80.w,
                                  height: 140.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(state.doctors[index].doctorImage)),
                                    shape: BoxShape.circle,
                                    color: Color(0xff93d1fe).withOpacity(0.2)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 78.0,top: 8.0).r,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10.h,),
                                    Text(item.doctorName,style: TextStyle(color: Color(0xff121212),fontSize: 22.sp,fontWeight: FontWeight.w600,),),
                                     SizedBox(height: 10.h,),
                                    Text(item.aboutDoctor,style: TextStyle(color: Color(0xff121212).withOpacity(0.4),fontSize: 16.sp,fontWeight: FontWeight.w400,),),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
            }else if(state is LoadInFailure){
              return const Center(child: Text("Error"),);
            }
            return const Text("oxirgi return");
          }),
        ),
      ),
    );
  }
}

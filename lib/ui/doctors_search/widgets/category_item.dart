import 'package:doctor_app/cubits/speciality/speciality_cubit.dart';
import 'package:doctor_app/ui/doctors_search/cubit/doctors_search_cubit.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

String currentTab = "Barchasi";

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialityCubit, SpecialityState>(
      builder: (context, state) {
        if (state is SpecialityInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SpecialitySuccess) {
          List titles = state.specialistModel.map((e) => e.id).toList();
          List titlesName = state.specialistModel.map((e) => e.title).toList();
          titles.insert(0, "Barchasi");
          return SizedBox(
            height: 36.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 12.w,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.w).r,
              scrollDirection: Axis.horizontal,
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(24.r),
                  onTap: () {
                    currentTab = titles[index];

                    if (titles[index] == "Barchasi") {
                      context.read<DoctorsSearchCubit>().fetchDoctorsInfo();
                    } else {
                      context
                          .read<DoctorsSearchCubit>()
                          .fetchSearchDoctors(titles[index]);
                    }
                  },
                  child: Container(
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: titles[index] == currentTab
                          ? MyColors.primary
                          : Colors.white,
                      border: Border.all(color: MyColors.primary),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 16.w),
                        child: Text(
                          titlesName[index],
                          style: MyTextStyle.sfProLight.copyWith(
                              fontWeight: FontWeight.w600,
                              color: titles[index] == currentTab
                                  ? Colors.white
                                  : MyColors.primary,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}


import 'package:doctor_app/cubits/speciality/speciality_cubit.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/ui/specialists/widgets/specialist_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SpecialistsScreen extends StatelessWidget {
  const SpecialistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:tr('home_screen.specialist_doctor'),
        widget: const SizedBox(),
      ),
      body: BlocBuilder<SpecialityCubit, SpecialityState>(
          builder: (context, state) {
        if (state is SpecialitySuccess) {
          return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemCount: state.specialistModel.length,
                itemBuilder: (context, index) {
                  return SpecialistWidget(
                      bcColor: "0xFF" + state.specialistModel[index].color,
                      imgUrl: state.specialistModel[index].iconPath,
                      name: state.specialistModel[index].title,
                      count: state.specialistModel[index].doctorsCount);
                },
              ));
        }
        return const SizedBox();
      }),

    );
  }
}

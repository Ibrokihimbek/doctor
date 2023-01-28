import 'package:doctor_app/data/models/doctor/doctor_model.dart';
import 'package:doctor_app/data/models/specialist/specialist_model.dart';
import 'package:doctor_app/data/repositories/speciality_repository.dart';
import 'package:doctor_app/ui/specialist_deatil_doctor/cubit/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialDetailCubit extends Cubit<SpecialDetailState>{
  SpecialDetailCubit({required this.specialityRepository}):super(Initial());


  final SpecialityRepository specialityRepository;


  getSingleSpecial({required String id}) async{
    emit(LoadInProgress());
    await specialityRepository.getSingleSpecial(id: id).listen((List<DoctorModel> doctors) {
      emit(LoadInSuccess(doctors: doctors));
    });
  }

}
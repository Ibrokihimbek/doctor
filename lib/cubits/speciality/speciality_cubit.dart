import 'package:bloc/bloc.dart';
import 'package:doctor_app/data/models/specialist/specialist_model.dart';
import 'package:doctor_app/data/repositories/speciality_repository.dart';
import 'package:meta/meta.dart';

part 'speciality_state.dart';

class SpecialityCubit extends Cubit<SpecialityState> {
  SpecialityCubit({required this.specialityRepository})
      : super(SpecialityInitial()) {
    _fetchSpecialityId(specialityId: "");
  }

  final SpecialityRepository specialityRepository;

  _fetchSpecialityId({required String specialityId}) {
    emit(SpecialityInProgress());

    specialityRepository
        .getSpecialists()
        .listen((event) {
      emit(SpecialitySuccess(specialistModel: event));
    });
  }
}

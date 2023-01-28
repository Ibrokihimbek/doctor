import 'package:doctor_app/data/models/doctor/doctor_model.dart';
import 'package:doctor_app/data/repositories/search_doctors_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctors_search_state.dart';

class DoctorsSearchCubit extends Cubit<DoctorsSearchState> {
  DoctorsSearchCubit(this.doctorSearchRepository)
      : super(DoctorsSearchInitial()) {
    fetchDoctorsInfo();
  }
  final DoctorSearchRepository doctorSearchRepository;

  fetchDoctorsInfo() async {
    emit(LoadDoctorsSearchProgress());
    doctorSearchRepository.getSearchDoctors().listen((doctors) {
      emit(LoadDoctorsSearchSuccess(doctors: doctors));
    });
  }

  fetchSearchDoctors(String name) {
    emit(LoadDoctorsSearchProgress());
    doctorSearchRepository.getDoctorsBySpeciality(name).listen((doctors) {
      emit(LoadDoctorsSearchSuccess(doctors: doctors));
    });
  }
}

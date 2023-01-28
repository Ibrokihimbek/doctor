import 'package:doctor_app/bloc/doctors/doctors_state.dart';
import 'package:doctor_app/data/repositories/doctors_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBloc extends Cubit<DoctorsState> {
  final DoctorRepository doctorRepository;

  DoctorsBloc(this.doctorRepository) : super(InitialDoctorState()) {
    _fetchDoctorsInfo();
  }

  _fetchDoctorsInfo() async {
    emit(LoadDoctorInProgress());
    doctorRepository.getDoctors().listen((doctors) {
    emit(LoadDoctorInSuccess(doctors: doctors));
    });
  }
}

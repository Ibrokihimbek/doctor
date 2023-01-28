import 'package:doctor_app/data/models/doctor/doctor_model.dart';

abstract class DoctorsState {}

class InitialDoctorState extends DoctorsState {}

class LoadDoctorInProgress extends DoctorsState {}

class LoadDoctorInSuccess extends DoctorsState {
  LoadDoctorInSuccess({required this.doctors});

  final List<DoctorModel> doctors;
}
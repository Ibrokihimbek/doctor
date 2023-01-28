part of 'doctors_search_cubit.dart';

@immutable
abstract class DoctorsSearchState {}

class DoctorsSearchInitial extends DoctorsSearchState {}

class LoadDoctorsSearchProgress extends DoctorsSearchState {}

class LoadDoctorsSearchSuccess extends DoctorsSearchState {
  LoadDoctorsSearchSuccess({required this.doctors});

  final List<DoctorModel> doctors;
}

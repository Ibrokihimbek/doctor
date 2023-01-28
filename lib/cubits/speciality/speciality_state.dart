part of 'speciality_cubit.dart';

@immutable
abstract class SpecialityState {}

class SpecialityInitial extends SpecialityState {}

class SpecialityInProgress extends SpecialityState {}

class SpecialitySuccess extends SpecialityState {
  final List<SpecialistModel> specialistModel;

  SpecialitySuccess({required this.specialistModel});
}

class SpecialityFailure extends SpecialityState {}

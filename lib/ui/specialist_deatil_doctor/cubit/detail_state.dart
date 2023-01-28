import 'package:doctor_app/data/models/doctor/doctor_model.dart';

abstract class SpecialDetailState{}

class Initial extends SpecialDetailState{}
class LoadInProgress extends SpecialDetailState{}
class LoadInSuccess extends SpecialDetailState{
  LoadInSuccess({required this.doctors});
  final List<DoctorModel> doctors;
}
class LoadInFailure extends SpecialDetailState{}
import 'package:doctor_app/data/models/appointment/appointment_model.dart';

abstract class UserAppointmentsState {}

//state set
class InitialUserAppointments extends UserAppointmentsState {}

class LoadAppointmentsInProgress extends UserAppointmentsState {}

class LoadAppointmentsInSuccess extends UserAppointmentsState {}

class LoadAppointmentsInFailure extends UserAppointmentsState {
  LoadAppointmentsInFailure({required this.error});

  String error;
}

class InitialGetAppointments extends UserAppointmentsState {}

class LoadGetAppointmentsInProgress extends UserAppointmentsState {}

class LoadGetAppointmentsInSuccess extends UserAppointmentsState {
  LoadGetAppointmentsInSuccess({required this.appointmentModel});

  final List<AppointmentModel> appointmentModel;
}

class LoadGetAppointmentsInFailure extends UserAppointmentsState {
  LoadGetAppointmentsInFailure({required this.error});

  final String error;
}

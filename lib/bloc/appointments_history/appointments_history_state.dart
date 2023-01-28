part of 'appointments_history_cubit.dart';

@immutable
abstract class AppointmentsHistoryState {}

class HistoryInitial extends AppointmentsHistoryState {}

class LoadHistoryInProgress extends AppointmentsHistoryState {}

class LoadHistoryInSuccess extends AppointmentsHistoryState {
  LoadHistoryInSuccess({required this.appointments});

  final List<AppointmentModel> appointments;
}

class LoadHistoryInFailure extends AppointmentsHistoryState {
  LoadHistoryInFailure({required this.error});

  final String error;
}

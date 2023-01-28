import 'package:doctor_app/bloc/get_appointements_cubit/user_appointments_state.dart';
import 'package:doctor_app/data/repositories/appointment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/appointment/appointment_model.dart';

class GetAppointmentsCubit extends Cubit<UserAppointmentsState> {
  GetAppointmentsCubit(
    this._appointmentsRepository,
  ) : super(InitialGetAppointments()) {
    _fetchAllAppointments();
  }

  final AppointmentsRepository _appointmentsRepository;

  _fetchAllAppointments() {
    emit(LoadGetAppointmentsInProgress());
    _appointmentsRepository
        .getAllAppointments()
        .listen((List<AppointmentModel> listAppointments) {
      emit(LoadGetAppointmentsInSuccess(appointmentModel: listAppointments));
    });
  }
}

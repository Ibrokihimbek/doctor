import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_event.dart';
import 'package:doctor_app/bloc/get_appointements_cubit/user_appointments_state.dart';
import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/data/repositories/appointment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsBloc
    extends Bloc<SingleAppointmentsEvent, UserAppointmentsState> {
  AppointmentsBloc(this.appointmentsRepository, this.appointmentModel)
      : super(InitialUserAppointments()) {
    on<AddAppointment>(_addAppointment);
  }

  final AppointmentsRepository appointmentsRepository;
  final AppointmentModel appointmentModel;
  bool isLoading = false;

  _addAppointment(
      AddAppointment event, Emitter<UserAppointmentsState> emit) async {
    notify(true);
    if (appointmentsRepository == true) {
      emit(LoadAppointmentsInProgress());
    }
    notify(false);
    if (isLoading == false) {
      await appointmentsRepository.addAppointment(
          appointmentModel: appointmentModel);
    }
  }

  notify(bool v) {
    isLoading = v;
  }
}

import 'package:bloc/bloc.dart';
import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/data/repositories/appointment_repository.dart';
import 'package:meta/meta.dart';

part 'appointments_history_state.dart';

class AppointmentsHistoryCubit extends Cubit<AppointmentsHistoryState> {
  AppointmentsHistoryCubit(this.appointmentsRepository) : super(HistoryInitial()){
    _fetchAppointmentsHistory();
  }

  final AppointmentsRepository appointmentsRepository;


  _fetchAppointmentsHistory() {
    emit(LoadHistoryInProgress());
    appointmentsRepository
        .getHistoryAppointments()
        .listen((List<AppointmentModel> listAppointments) {
          print("HISTORY M O D E L:${listAppointments.length}");
      emit(LoadHistoryInSuccess(appointments: listAppointments));
    });
  }

}

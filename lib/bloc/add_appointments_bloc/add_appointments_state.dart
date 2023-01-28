import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:equatable/equatable.dart';

class SingleAppointmentsState extends Equatable {
  final AppointmentModel appointmentModel;

  const SingleAppointmentsState({required this.appointmentModel});

  SingleAppointmentsState copyWith({AppointmentModel? appointmentModel}) =>
      SingleAppointmentsState(
        appointmentModel: appointmentModel ?? this.appointmentModel,
      );

  @override
  List<Object?> get props => [appointmentModel];
}

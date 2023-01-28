import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_event.dart';
import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_state.dart';
import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/data/repositories/appointment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleAppointmentsBloc
    extends Bloc<SingleAppointmentsEvent, SingleAppointmentsState> {
  SingleAppointmentsBloc({required this.appointmentsRepository})
      : super(
          SingleAppointmentsState(
            appointmentModel: AppointmentModel(
                doctorName: "",
                createdAt: "",
                doctorImage: "",
                doctorId: "",
                status: "scheduled",
                //canceled
                //done
                type: "",
                userId: "",
                appointmentId: "",
                bookedHours: [],
                hour: "",
                age: "",
                amOrPm: "",
                fullName: "",
                gender: "",
                phoneNumber: "",
                problem: "",
                weekData: ""),
          ),
        ) {
    on<UpdateStatus>(_updateStatus);
    on<UpdateBookingPatientDetailsScreen>(_updateBookingPatientDetailsScreen);
    on<UpdateBookAppointmentScreen>(_updateBookAppointmentScreen);
    on<UpdateDoctorDetailsScreen>(_updateDoctorDetailsScreen);
    on<AddAppointment>(_addAppointment);
  }

  final AppointmentsRepository appointmentsRepository;

  _updateDoctorDetailsScreen(
      UpdateDoctorDetailsScreen event, Emitter<SingleAppointmentsState> emit) {
    AppointmentModel appointmentModel = state.appointmentModel.copyWith(
        doctorName: event.doctorName,
        doctorImage: event.doctorImage,
        weekData: event.weekData,
        doctorId: event.doctorId,
        userId: event.userid);
    emit(state.copyWith(appointmentModel: appointmentModel));
  }

  _updateBookAppointmentScreen(UpdateBookAppointmentScreen event,
      Emitter<SingleAppointmentsState> emit) {
    AppointmentModel appointmentModel = state.appointmentModel
        .copyWith(amOrPm: event.amOrPm, hour: event.hour, type: event.type);
    emit(state.copyWith(appointmentModel: appointmentModel));
  }

  _updateBookingPatientDetailsScreen(UpdateBookingPatientDetailsScreen event,
      Emitter<SingleAppointmentsState> emit) {
    AppointmentModel appointmentModel = state.appointmentModel.copyWith(
      age: event.age,
      fullName: event.fullName,
      gender: event.gender,
      phoneNumber: event.phoneNumber,
      problem: event.problem,
      createdAt: event.createdAd,
    );
    emit(state.copyWith(appointmentModel: appointmentModel));
  }

  _updateStatus(UpdateStatus event, Emitter<SingleAppointmentsState> emit) {
    AppointmentModel appointmentModel =
        state.appointmentModel.copyWith(status: event.status);
    emit(state.copyWith(appointmentModel: appointmentModel));
  }

  _addAppointment(
      SingleAppointmentsEvent event, Emitter<SingleAppointmentsState> emit) {
    AppointmentModel appointmentModel = state.appointmentModel;
    appointmentsRepository.addAppointment(appointmentModel: appointmentModel);
  }
}

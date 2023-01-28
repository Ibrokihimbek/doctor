abstract class SingleAppointmentsEvent {}

class UpdateDoctorDetailsScreen extends SingleAppointmentsEvent {
  UpdateDoctorDetailsScreen({
    required this.doctorImage,
    required this.doctorId,
    required this.weekData,
    required this.doctorName,
    required this.userid,
  });

  final String doctorName;
  final String doctorImage;
  final String doctorId;
  final String weekData;
  final String userid;
}

class UpdateBookAppointmentScreen extends SingleAppointmentsEvent {
  UpdateBookAppointmentScreen({
    required this.amOrPm,
    required this.hour,
    required this.type,
  });

  final String amOrPm;
  final String hour;
  final String type;
}

class UpdateCreatedAd extends SingleAppointmentsEvent {
  UpdateCreatedAd({required this.createdAd});

  final String createdAd;
}

class UpdateBookingPatientDetailsScreen extends SingleAppointmentsEvent {
  UpdateBookingPatientDetailsScreen({
    required this.fullName,
    required this.age,
    required this.phoneNumber,
    required this.gender,
    required this.problem,
    required this.createdAd,
  });

  final String fullName;
  final String age;
  final String phoneNumber;
  final String gender;
  final String problem;
  final String createdAd;
}

class UpdateStatus extends SingleAppointmentsEvent {
  UpdateStatus({required this.status});

  final String status;
}

class AddAppointment extends SingleAppointmentsEvent {}

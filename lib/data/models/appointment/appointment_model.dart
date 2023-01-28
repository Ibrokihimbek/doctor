class AppointmentModel {
  final String appointmentId;
  final String doctorName;
  final String doctorId;
  final String createdAt;
  final String doctorImage;
  final String status;
  final String type;
  final String userId;
  final List<DateTime> bookedHours;
  final String weekData;
  final String amOrPm;
  final String hour;
  final String fullName;
  final String age;
  final String phoneNumber;
  final String gender;
  final String problem;

  AppointmentModel({
    required this.doctorName,
    required this.createdAt,
    required this.doctorImage,
    required this.doctorId,
    required this.status,
    required this.type,
    required this.userId,
    required this.appointmentId,
    required this.bookedHours,
    required this.hour,
    required this.age,
    required this.amOrPm,
    required this.fullName,
    required this.gender,
    required this.phoneNumber,
    required this.problem,
    required this.weekData,
  });

  AppointmentModel copyWith({
    String? doctorName,
    String? createdAt,
    String? doctorImage,
    String? doctorId,
    String? status,
    String? type,
    String? userId,
    String? appointmentId,
    List? bookedHours,
    String? hour,
    String? age,
    String? amOrPm,
    String? fullName,
    String? gender,
    String? phoneNumber,
    String? problem,
    String? weekData,
  }) {
    return AppointmentModel(
      doctorId: doctorId ?? this.doctorId,
      hour: hour ?? this.hour,
      age: age ?? this.age,
      amOrPm: amOrPm ?? this.amOrPm,
      appointmentId: appointmentId ?? this.appointmentId,
      weekData: weekData ?? this.weekData,
      problem: problem ?? this.problem,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      doctorName: doctorName ?? this.doctorName,
      doctorImage: doctorImage ?? this.doctorImage,
      bookedHours: [],
      createdAt: createdAt ?? this.createdAt,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      type: type ?? this.type,
      userId: userId ?? this.userId,
    );
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      hour: json['hour'] as String? ?? '',
      amOrPm: json['amOrPm'] as String? ?? "",
      age: json['age'] as String? ?? "",
      weekData: json['weekData'] as String? ?? "",
      fullName: json['fullName'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      problem: json['problem'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      doctorName: json['doctor_name'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      doctorImage: json['doctor_image'] as String? ?? '',
      doctorId: json['doctor_id'] as String? ?? '',
      status: json['status'] as String? ?? '',
      type: json['type'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      appointmentId: json['appointment_id'] as String? ?? '',
      bookedHours: (json['booked_hours'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          [],
    );
  }

  @override
  String toString() {
    return '''
      doctorName : $doctorName,
      createdAt : $createdAt,
      doctorImage : $doctorImage,
      doctorId : $doctorId,
      status : $status,
      type : $type,
      userId : $userId,
      appointmentId : $appointmentId,
      bookedHours : $bookedHours,
      hour : $hour,
      age : $age,
      amOrPm : $amOrPm,
      fullName : $fullName,
      gender : $gender,
      phoneNumber : $phoneNumber,
      problem : $problem,
      weekData : $weekData,
    ''';
  }
}

import 'package:doctor_app/data/models/doctor/working_time.dart';

class DoctorModel {
  DoctorModel({
    required this.workingTime,
    required this.doctorName,
    required this.rating,
    required this.createdAt,
    required this.aboutDoctor,
    required this.doctorId,
    required this.doctorImage,
    required this.experience,
    required this.fcmToken,
    required this.patientCount,
    required this.specialityId,
    required this.busyHours,
    required this.specialityName,
  });

  final String doctorImage;
  final String doctorId;
  final String doctorName;
  final String specialityName;
  final num rating;
  final String specialityId;
  final String createdAt;
  final String fcmToken;
  final int patientCount;
  final int experience;
  final String aboutDoctor;
  final WorkingTime workingTime;
  final List<dynamic> busyHours;

  factory DoctorModel.fromJson(Map<String, Object?> json) {
    return DoctorModel(
      busyHours: json["busy_hours"] as List<dynamic>? ?? [],
      doctorId: json["doctor_id"] as String? ?? "",
      doctorImage: json["doctor_image"] as String? ?? "",
      aboutDoctor: json["about_doctor"] as String? ?? "",
      createdAt: json["created_at"] as String? ?? "",
      doctorName: json["doctor_name"] as String? ?? "",
      experience: json["experience"] as int? ?? 0,
      specialityName: json["speciality_name"] as String? ?? "",
      patientCount: json["patient_count"] as int? ?? 0,
      rating: json["rating"] as num? ?? 0,
      specialityId: json["speciality_id"] as String? ?? "",
      fcmToken: json["fcm_token"] as String? ?? "",
      workingTime: WorkingTime.fromJson(
        json["working_time"] as Map<String, Object?>,
      ),
    );
  }
}

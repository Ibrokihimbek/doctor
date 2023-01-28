import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/data/repositories/storage_repository.dart';
import 'package:flutter/cupertino.dart';

class AppointmentsRepository {
  late FirebaseFirestore _firestore;

  AppointmentsRepository({required FirebaseFirestore firebaseFirestore}) {
    _firestore = firebaseFirestore;
  }

  Future<void> addAppointment(
      {required AppointmentModel appointmentModel}) async {
    try {
      DocumentReference newAppointments =
          await _firestore.collection("appointments").add({
        'appointment_id': appointmentModel.appointmentId,
        'doctor_name': appointmentModel.doctorName,
        'doctor_id': appointmentModel.doctorId,
        'created_at': appointmentModel.createdAt,
        'doctor_image': appointmentModel.doctorImage,
        'status': appointmentModel.status,
        'type': appointmentModel.type,
        'user_id': appointmentModel.userId,
        'booked_hours': appointmentModel.bookedHours
            .map((e) => e.toIso8601String())
            .toList(),
        "hour": appointmentModel.hour,
        "age": appointmentModel.age,
        "amOrPm": appointmentModel.amOrPm,
        "weekData": appointmentModel.weekData,
        "problem": appointmentModel.problem,
        "phoneNumber": appointmentModel.phoneNumber,
        "fullName": appointmentModel.fullName,
        "gender": appointmentModel.gender,
      });
      await _firestore
          .collection("appointments")
          .doc(newAppointments.id)
          .update({
        "appointment_id": newAppointments.id,
      });

      debugPrint(
          "Qo'shildi-----------=================================================================================");
    } on FirebaseException catch (er) {
      debugPrint(er.toString());
    }
  }

  Stream<List<AppointmentModel>> getAllAppointments() => _firestore
      .collection("appointments")
      //.where("status", isEqualTo: 'scheduled')
      .snapshots()
      .map(
        (querySnapshot) => querySnapshot.docs
            .map((doc) => AppointmentModel.fromJson(doc.data()))
            .toList(),
      );


  Future<void> updateStatus(
      {required String status, required String docId}) async {
    try {
      await _firestore.collection("doctors").doc(docId).update({
        "status": status,
      });
    } on FirebaseException catch (er) {
      debugPrint(er.toString());
    }
  }

  /// Filter apointment status

  Stream<List<AppointmentModel>> getHistoryAppointments() async* {
    yield* _firestore
        .collection('appointments')
        .where("status", isNotEqualTo: "scheduled")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => AppointmentModel.fromJson(doc.data()))
              .toList(),
        );
  }

  /// Filter apointment type Messaging 
  
  Stream<List<AppointmentModel>> getTypeMessaging() async* {
    yield* _firestore
        .collection('appointments')
    //message
    //call
        .where("type", isEqualTo: 'message')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => AppointmentModel.fromJson(doc.data()))
              .toList(),
        );
  } 

  /// Filter apointment status Voice Call

  Stream<List<AppointmentModel>> getTypeVoiceCall() async* {
    yield* _firestore
        .collection('appointments')
        .where("type", isEqualTo: 'call')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => AppointmentModel.fromJson(doc.data()))
              .toList(),
        );
  }
}

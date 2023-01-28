import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/data/models/doctor/doctor_model.dart';

class DoctorSearchRepository {
  final FirebaseFirestore _firestore;

  DoctorSearchRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Stream<List<DoctorModel>> getSearchDoctors() =>
      _firestore.collection("doctors").snapshots().map(
            (event) => event.docs
                .map((doc) => DoctorModel.fromJson(doc.data()))
                .toList(),
          );

  Stream<List<DoctorModel>> getDoctorsBySpeciality(String name) => _firestore
      .collection("doctors")
      .where("speciality_name", isEqualTo: name)
      .snapshots()
      .map(
        (event) =>
            event.docs.map((doc) => DoctorModel.fromJson(doc.data())).toList(),
      );
}

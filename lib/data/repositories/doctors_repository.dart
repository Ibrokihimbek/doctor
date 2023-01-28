import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/data/models/doctor/doctor_model.dart';

class DoctorRepository {
  final FirebaseFirestore _firestore;

  DoctorRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Stream<List<DoctorModel>> getDoctors() =>
      _firestore.collection("doctors").snapshots().map(
            (event) => event.docs
                .map((doc) => DoctorModel.fromJson(doc.data()))
                .toList(),
          );

}

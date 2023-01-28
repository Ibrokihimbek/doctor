import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/data/models/doctor/doctor_model.dart';
import 'package:doctor_app/data/models/specialist/specialist_model.dart';

class SpecialityRepository {
  final FirebaseFirestore _firestore;
  SpecialityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Stream<List<SpecialistModel>> getSpecialists() =>
      _firestore.collection("specialists").snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => SpecialistModel.fromJson(doc.data()))
                .toList(),
          );

  Stream<List<DoctorModel>> getSingleSpecial({required String id}) async* {
    yield*  _firestore
        .collection('doctors')
        .where("speciality_id", isEqualTo: id)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
          .map((doc) => DoctorModel.fromJson(doc.data()))
          .toList(),
    );
  }
}

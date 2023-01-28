import 'package:cloud_firestore/cloud_firestore.dart';
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
}

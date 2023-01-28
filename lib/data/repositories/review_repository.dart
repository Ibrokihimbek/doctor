import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/data/models/review/review_model.dart';
import 'package:doctor_app/utils/my_utils.dart';

class ReviewRepository {
  final FirebaseFirestore _firestore;

  ReviewRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<bool> addReview({required ReviewModel reviewModel}) async {
    try {
      DocumentReference newReview =
          await _firestore.collection("reviews").add(reviewModel.toJson());
      await _firestore.collection("reviews").doc(newReview.id).update({
        "review_id": newReview.id,
      });
      MyUtils.getMyToast(message: "New review successfully added!");
      return newReview.id.isNotEmpty;
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
      return false;
    }
  }

  Future<void> updateReview({required ReviewModel reviewModel}) async {
    try {
      await _firestore
          .collection("reviews")
          .doc(reviewModel.reviewId)
          .update(reviewModel.toJson());

      MyUtils.getMyToast(message: "Review successfully updated!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<ReviewModel>> getReviews() =>
      _firestore.collection("reviews").snapshots().map(
            (event1) => event1.docs
                .map((doc) => ReviewModel.fromJson(doc.data()))
                .toList(),
          );
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/data/models/users/user_model.dart';
import 'package:doctor_app/data/repositories/storage_repository.dart';
import 'package:doctor_app/utils/my_utils.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  /// Update UserInfo
  Future<void> updateUserInfo({required UserModel userModel}) async {
    String userId = await StorageRepository.getUserId();
    try {
      await _firestore
          .collection("users")
          .doc(userId)
          .update(userModel.toJson());
    } on FirebaseException catch (e) {
      MyUtils.getMyToast(message: e.message.toString());
    }
  }

  /// Update FCM token
  Future<void> updateUserFCMToken({
    required String fcmToken,
    required String docId,
    required String userId,
  }) async {
    try {
      await _firestore.collection("users").doc(docId).update({
        "fcm_token": fcmToken,
        "userId": userId,
      });
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  /// Fetch single user
  Stream<List<UserModel>> getSingleUser() async* {
    String userId = await StorageRepository.getUserId();
    yield* _firestore
        .collection('users')
        .where("userId", isEqualTo: userId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data()))
              .toList(),
        );
  }
}

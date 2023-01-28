// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      comment: json['comment'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      doctorId: json['doctor_id'] as String? ?? '',
      reviewId: json['review_id'] as String? ?? '',
      starCount: json['star_count'] as int? ?? 0,
      userId: json['user_id'] as String? ?? '',
      userImage: json['user_image'] as String? ?? '',
      userName: json['user_name'] as String? ?? '',
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'star_count': instance.starCount,
      'doctor_id': instance.doctorId,
      'created_at': instance.createdAt,
      'comment': instance.comment,
      'user_id': instance.userId,
      'user_image': instance.userImage,
      'user_name': instance.userName,
    };

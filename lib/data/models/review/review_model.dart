import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  @JsonKey(defaultValue: "", name: "review_id")
  String reviewId;

  @JsonKey(defaultValue: 0, name: "star_count")
  int starCount;

  @JsonKey(defaultValue: "", name: "doctor_id")
  String doctorId;

  @JsonKey(defaultValue: "", name: "created_at")
  String createdAt;

  @JsonKey(defaultValue: "", name: "comment")
  String comment;

  @JsonKey(defaultValue: "", name: "user_id")
  String userId;

  @JsonKey(defaultValue: "", name: "user_image")
  String userImage;

  @JsonKey(defaultValue: "", name: "user_name")
  String userName;

  ReviewModel({
    required this.comment,
    required this.createdAt,
    required this.doctorId,
    required this.reviewId,
    required this.starCount,
    required this.userId,
    required this.userImage,
    required this.userName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

class UserModel {
  final String email;
  final String password;
  final String userId;
  final String fullName;
  final String phoneNumber;
  final String imageUrl;
  final DateTime createdAt;
  final String fcmToken;
  final DateTime birthDate;
  final String address;
  final String gender;
  final List<String> favorites;

  UserModel(
      {required this.favorites,
      required this.gender,
      required this.address,
      required this.birthDate,
      required this.createdAt,
      required this.imageUrl,
      required this.fullName,
      required this.phoneNumber,
      required this.userId,
      required this.fcmToken,
      required this.email,
      required this.password});

  factory UserModel.fromJson(Map<String, Object?> json) {
    return UserModel(
      favorites: json["favorites"] as List<String>? ?? [],
      gender: json["gender"] as String? ?? "",
      birthDate: DateTime.parse(json["birth_date"] as String? ?? ""),
      address: json["address"] as String? ?? "",
      userId: json["user_id"] as String? ?? "",
      fcmToken: json["fcm_token"] as String? ?? "",
      fullName: json["full_name"] as String? ?? "",
      phoneNumber: json["phone_number"] as String? ?? "",
      createdAt: DateTime.parse(json["created_at"] as String? ?? ""),
      imageUrl: json["image_url"] as String? ?? "",

      password: json["password"] as String? ?? "",
      email: json["email"] as String? ?? "",
    );
  }

  Map<String, Object> toJson() {
    return {
      "userId": userId,
      "full_name": fullName,
      "phone_number": phoneNumber,
      "created_at": createdAt.toString(),
      "image_url": imageUrl,
      "fcm_token": fcmToken,
      "gender": gender,
      "birth_date": birthDate.toString(),
      "address": address,
      "email": email,
      "password": password
    };
  }

  UserModel copyWith({
    String? userId,
    String? fullName,
    String? phoneNumber,
    String? imageUrl,
    DateTime? createdAt,
    String? fcmToken,
    DateTime? birthDate,
    String? address,
    String? gender,
    String? email,
    String? password,
    List<String>? favorites,
  }) =>
      UserModel(
          favorites: favorites ?? this.favorites,
          gender: gender ?? this.gender,
          address: address ?? this.address,
          birthDate: birthDate ?? this.birthDate,
          createdAt: createdAt ?? this.createdAt,
          imageUrl: imageUrl ?? this.imageUrl,
          fullName: fullName ?? this.fullName,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          userId: userId ?? this.userId,
          fcmToken: fcmToken ?? this.fcmToken,
          password: password ?? this.password,
          email: email ?? this.email);
}

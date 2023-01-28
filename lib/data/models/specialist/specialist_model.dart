import 'package:flutter/material.dart';

class SpecialistModel {
  final String createdAt;
  final String doctorsCount;
  final String iconPath;
  final String id;
  final String color;
  final String title;
  SpecialistModel(
      {required this.color,
      required this.createdAt,
      required this.doctorsCount,
      required this.iconPath,
      required this.id,
      required this.title});
  factory SpecialistModel.fromJson(Map<String, dynamic> json) {
    return SpecialistModel(
      color: json['color'] ?? "",
      createdAt: json['created_at'] ?? "",
      doctorsCount: json['doctors_count'] ?? "",
      iconPath: json['icon_path'] ?? "",
      id: json['id'] ?? "",
      title: json['title'] ?? "",
    );
  }
}

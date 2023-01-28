import 'package:doctor_app/data/models/open_data_model/data_model.dart';

class Result {
  int count;
  List<Data> data;

  Result({
    required this.count,
    required this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      count: json['count'] as int? ?? 0,
      data: (json['data'] as List).map((e) => Data.fromJson(e)).toList(),
    );
  }
}

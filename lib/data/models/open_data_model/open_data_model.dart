import 'package:doctor_app/data/models/open_data_model/result_model.dart';

class InfoOpenData {
  final Result result;

  InfoOpenData({required this.result});

  factory InfoOpenData.fromJson(Map<String, dynamic> json) {
    return (InfoOpenData(
      result: json['result'],
    ));
  }
}

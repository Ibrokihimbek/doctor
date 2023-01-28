const String tableName = "notification_app";

class NotificationFields {
  static final List<String> values = [
    /// Add all fields
    id, title, body, date
  ];
  static const String id = "_id";
  static const String title = "title";
  static const String body = "body";
  static const String date = "date";
}

class NotificationModel {
  final int? id;
  final String body;
  final String title;
  final String date;

  NotificationModel(
      {this.id, required this.title, required this.date, required this.body});

  NotificationModel copyWith(
          {int? id, String? title, String? body, String? date}) =>
      NotificationModel(
          id: id ?? this.id,
          title: title ?? this.title,
          body: body ?? this.body,
          date: date ?? this.date);

  static NotificationModel fromJson(Map<String, Object?> json) =>
      NotificationModel(
          id: json[NotificationFields.id] as int?,
          title: json[NotificationFields.title] as String,
          body: json[NotificationFields.body] as String,
          date: json[NotificationFields.date] as String);

  Map<String, Object?> toJson() => {
        NotificationFields.id: id,
        NotificationFields.title: title,
        NotificationFields.date: date,
        NotificationFields.body: body
      };

  @override
  String toString() => '''
        ID: ${this.id} 
        USER NAME ${this.title} 
        SUMM ${this.body}
        DATE ${this.date}
      ''';
}

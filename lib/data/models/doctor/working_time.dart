class WorkingTime {
  WorkingTime({
    required this.friday,
    required this.monday,
    required this.saturday,
    required this.sunday,
    required this.thursday,
    required this.tuesday,
    required this.wednesday,
  });

  final List<dynamic> monday;
  final List<dynamic> tuesday;
  final List<dynamic> wednesday;
  final List<dynamic> thursday;
  final List<dynamic> friday;
  final List<dynamic> saturday;
  final List<dynamic> sunday;

  factory WorkingTime.fromJson(Map<String, Object?> json) {
    return WorkingTime(
      monday: json["mon"] as List<dynamic>? ?? [],
      tuesday: json["tue"] as List<dynamic>? ?? [],
      wednesday: json["wed"] as List<dynamic>? ?? [],
      thursday: json["thu"] as List<dynamic>? ?? [],
      friday: json["fri"] as List<dynamic>? ?? [],
      saturday: json["sat"] as List<dynamic>? ?? [],
      sunday: json["sun"] as List<dynamic>? ?? [],
    );
  }
}

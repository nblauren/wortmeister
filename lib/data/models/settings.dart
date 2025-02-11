class Settings {
  final String userId;
  final int dailyGoal;
  final String language;
  final bool reminders;

  Settings(
      {required this.userId,
      required this.dailyGoal,
      required this.language,
      required this.reminders});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      userId: json['user_id'],
      dailyGoal: json['daily_goal'],
      language: json['language'],
      reminders: json['reminders'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'daily_goal': dailyGoal,
      'language': language,
      'reminders': reminders,
    };
  }
}

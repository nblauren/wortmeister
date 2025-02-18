import 'package:isar/isar.dart';

part 'deck.g.dart';

@Collection()
class Deck {
  Id id = Isar.autoIncrement;

  @Index()
  late String deckId;

  @Index()
  late String userId;

  late String title;

  late String description;

  late List<String> wordIds;

  late int dailyNewLimit;

  late int dailyReviewLimit;

  late DateTime createdAt;

  late String createdBy;

  DateTime? lastSessionDate;

  late int reviewedToday;

  late int newLearnedToday;

  Deck({
    required this.deckId,
    required this.userId,
    required this.title,
    required this.description,
    required this.wordIds,
    required this.dailyNewLimit,
    required this.dailyReviewLimit,
    required this.createdAt,
    required this.createdBy,
    this.lastSessionDate,
    required this.reviewedToday,
    required this.newLearnedToday,
  });

  factory Deck.newEntry({
    required String deckId,
    required String userId,
    required String title,
    required String description,
    List<String> wordIds = const [],
    int dailyNewLimit = 50,
    int dailyReviewLimit = 200,
    required String createdBy,
  }) {
    return Deck(
      deckId: deckId,
      userId: userId,
      title: title,
      description: description,
      wordIds: wordIds,
      dailyNewLimit: dailyNewLimit,
      dailyReviewLimit: dailyReviewLimit,
      createdAt: DateTime.now(),
      createdBy: createdBy,
      lastSessionDate: null,
      reviewedToday: 0,
      newLearnedToday: 0,
    );
  }

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      deckId: json['deck_id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      wordIds: List<String>.from(json['word_ids']),
      dailyNewLimit: json['daily_new_limit'],
      dailyReviewLimit: json['daily_review_limit'],
      createdAt: DateTime.parse(json["created_at"]),
      createdBy: json['created_by'],
      lastSessionDate: json["last_session_date"] != null
          ? DateTime.parse(json["last_session_date"])
          : null,
      reviewedToday: json['reviewed_today'],
      newLearnedToday: json['new_learned_today'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deck_id': deckId,
      'user_id': userId,
      'title': title,
      'description': description,
      'word_ids': wordIds,
      'daily_new_limit': dailyNewLimit,
      'daily_review_limit': dailyReviewLimit,
      'created_at': createdAt.toUtc().toIso8601String(),
      'created_by': createdBy,
      'last_session_date': lastSessionDate?.toUtc().toIso8601String(),
      'reviewed_today': reviewedToday,
      'new_learned_today': newLearnedToday,
    };
  }
}

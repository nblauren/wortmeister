import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:isar/isar.dart';

part 'deck.g.dart';

@Collection()
class Deck {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String deckId;

  @Index()
  late String userId;

  late String title;

  late String description;

  late List<String> wordIds = [];

  late int dailyNewLimit;

  late int dailyReviewLimit;

  late DateTime createdAt;

  late String createdBy;

  DateTime? lastSessionDate;

  late int reviewedToday;

  late int newLearnedToday;

  late DateTime lastUpdated;

  bool isDeleted;

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
    required this.lastUpdated,
    this.isDeleted = false,
  });

  factory Deck.newEntry({
    required String deckId,
    required String userId,
    required String title,
    required String description,
    required int dailyNewLimit,
    required int dailyReviewLimit,
    List<String> wordIds = const [],
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
      lastUpdated: DateTime.now(),
      isDeleted: false,
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
      createdAt: json["created_at"] is firestore.Timestamp
          ? (json["created_at"] as firestore.Timestamp).toDate()
          : DateTime.parse(json["created_at"]),
      createdBy: json['created_by'],
      lastSessionDate: json["last_session_date"] != null
          ? (json["last_session_date"] is firestore.Timestamp
              ? (json["last_session_date"] as firestore.Timestamp).toDate()
              : DateTime.parse(json["last_session_date"]))
          : null,
      reviewedToday: json['reviewed_today'],
      newLearnedToday: json['new_learned_today'],
      lastUpdated: json["last_updated"] is firestore.Timestamp
          ? (json["last_updated"] as firestore.Timestamp).toDate()
          : DateTime.parse(json["last_updated"]),
      isDeleted: json['is_deleted'] ?? false,
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
      'last_updated': lastUpdated,
      'isDeleted': isDeleted,
    };
  }
}

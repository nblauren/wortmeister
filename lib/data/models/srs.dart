import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:isar/isar.dart';

part 'srs.g.dart';

@Collection()
class Srs {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String srsId;

  @Index()
  late String userId;

  @Index()
  late String wordId;

  DateTime? lastReviewed;

  late DateTime nextReview;

  late int interval;

  late double easeFactor;

  late int streak;

  late int reviewCount;

  late int correctCount;

  late int incorrectCount;

  late int learningStep;

  late bool suspended;

  late DateTime lastUpdated;

  bool isDeleted;

  Srs({
    required this.srsId,
    required this.userId,
    required this.wordId,
    this.lastReviewed,
    required this.nextReview,
    required this.interval,
    required this.easeFactor,
    required this.streak,
    required this.reviewCount,
    required this.correctCount,
    required this.incorrectCount,
    required this.suspended,
    required this.lastUpdated,
    required this.learningStep,
    this.isDeleted = false,
  });

  factory Srs.newEntry(
      {required String srsId, required String userId, required String wordId}) {
    return Srs(
      srsId: srsId,
      userId: userId,
      wordId: wordId,
      lastReviewed: null,
      nextReview: DateTime.now(),
      interval: 1,
      easeFactor: 2.5,
      streak: 0,
      reviewCount: 0,
      learningStep: 0,
      correctCount: 0,
      incorrectCount: 0,
      suspended: false,
      lastUpdated: DateTime.now(),
      isDeleted: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "srs_id": srsId,
      "user_id": userId,
      "word_id": wordId,
      "last_reviewed": lastReviewed?.toUtc(),
      "next_review": nextReview.toUtc(),
      "interval": interval,
      "ease_factor": easeFactor,
      "streak": streak,
      "review_count": reviewCount,
      "correct_count": correctCount,
      "incorrect_count": incorrectCount,
      "learning_step": learningStep,
      "suspended": suspended,
      "last_updated": lastUpdated,
      "is_deleted": isDeleted,
    };
  }

  factory Srs.fromJson(Map<String, dynamic> json) {
    return Srs(
      srsId: json["srs_id"],
      userId: json["user_id"],
      wordId: json["word_id"],
      lastReviewed: json["last_reviewed"] != null
          ? (json["last_reviewed"] is firestore.Timestamp
              ? (json["last_reviewed"] as firestore.Timestamp).toDate()
              : DateTime.parse(json["last_reviewed"]))
          : null,
      nextReview: json["next_review"] is firestore.Timestamp
          ? (json["next_review"] as firestore.Timestamp).toDate()
          : DateTime.parse(json["next_review"]),
      interval: json["interval"],
      easeFactor: (json["ease_factor"] as num).toDouble(),
      streak: json["streak"],
      reviewCount: json["review_count"],
      correctCount: json["correct_count"],
      incorrectCount: json["incorrect_count"],
      learningStep: json["learning_step"] ?? 0,
      suspended: json["suspended"],
      lastUpdated: json["last_updated"] is firestore.Timestamp
          ? (json["last_updated"] as firestore.Timestamp).toDate()
          : DateTime.parse(json["last_updated"]),
      isDeleted: json['is_deleted'] ?? false,
    );
  }

  Srs copyWith({
    String? srsId,
    String? userId,
    String? wordId,
    DateTime? lastReviewed,
    DateTime? nextReview,
    int? interval,
    double? easeFactor,
    int? streak,
    int? reviewCount,
    int? correctCount,
    int? incorrectCount,
    int? learningStep,
    bool? suspended,
    DateTime? lastUpdated,
    bool? isDeleted,
  }) {
    return Srs(
      srsId: srsId ?? this.srsId,
      userId: userId ?? this.userId,
      wordId: wordId ?? this.wordId,
      lastReviewed: lastReviewed ?? this.lastReviewed,
      nextReview: nextReview ?? this.nextReview,
      interval: interval ?? this.interval,
      easeFactor: easeFactor ?? this.easeFactor,
      streak: streak ?? this.streak,
      reviewCount: reviewCount ?? this.reviewCount,
      correctCount: correctCount ?? this.correctCount,
      incorrectCount: incorrectCount ?? this.incorrectCount,
      suspended: suspended ?? this.suspended,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      isDeleted: isDeleted ?? this.isDeleted,
      learningStep: learningStep ?? this.learningStep,
    );
  }
}

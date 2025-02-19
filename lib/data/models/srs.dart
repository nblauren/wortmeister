import 'package:isar/isar.dart';

part 'srs.g.dart';

@Collection()
class Srs {
  Id id = Isar.autoIncrement;

  @Index()
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
          ? DateTime.parse(json["last_reviewed"])
          : null,
      nextReview: DateTime.parse(json["next_review"]),
      interval: json["interval"],
      easeFactor: (json["ease_factor"] as num).toDouble(),
      streak: json["streak"],
      reviewCount: json["review_count"],
      correctCount: json["correct_count"],
      incorrectCount: json["incorrect_count"],
      suspended: json["suspended"],
      lastUpdated: json["last_updated"],
      isDeleted: json["is_deleted"],
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
    );
  }
}

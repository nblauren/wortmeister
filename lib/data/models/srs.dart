import 'package:cloud_firestore/cloud_firestore.dart';

class Srs {
  final String srsId;
  final String userId;
  final String wordId;
  final DateTime? lastReviewed;
  final DateTime nextReview;
  final int interval;
  final double easeFactor;
  final int streak;
  final int reviewCount;
  final int correctCount;
  final int incorrectCount;
  final bool suspended;

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
  });

  // Default values for a new SRS entry
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
    );
  }

  // Convert to JSON (for Firebase)
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
    };
  }

  // Create object from Firebase snapshot
  factory Srs.fromJson(Map<String, dynamic> json) {
    return Srs(
      srsId: json["srs_id"],
      userId: json["user_id"],
      wordId: json["word_id"],
      lastReviewed: json["last_reviewed"] != null
          ? (json["last_reviewed"] as Timestamp).toDate()
          : null,
      nextReview: (json["next_review"] as Timestamp).toDate(),
      interval: json["interval"],
      easeFactor: (json["ease_factor"] as num).toDouble(),
      streak: json["streak"],
      reviewCount: json["review_count"],
      correctCount: json["correct_count"],
      incorrectCount: json["incorrect_count"],
      suspended: json["suspended"],
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
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:isar/isar.dart';

part 'review_history.g.dart';

@Collection()
class ReviewHistory {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String reviewHistoryId;

  @Index()
  late String deckId;

  @Index()
  late DateTime date;

  late int reviewWordCount;

  late int newWordReviewCount;

  ReviewHistory({
    required this.reviewHistoryId,
    required this.deckId,
    required this.date,
    required this.reviewWordCount,
    required this.newWordReviewCount,
  });

  factory ReviewHistory.fromJson(Map<String, dynamic> json) {
    return ReviewHistory(
      reviewHistoryId: json['review_history_id'],
      deckId: json['deck_id'],
      date: json["date"] is firestore.Timestamp
          ? (json["date"] as firestore.Timestamp).toDate()
          : DateTime.parse(json["date"]),
      reviewWordCount: json['review_word_count'],
      newWordReviewCount: json['new_word_review_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'review_history_id': reviewHistoryId,
      'deck_id': deckId,
      'date': date.toUtc().toIso8601String(),
      'review_word_count': reviewWordCount,
      'new_word_review_count': newWordReviewCount,
    };
  }
}

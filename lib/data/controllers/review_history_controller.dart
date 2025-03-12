import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'package:wortmeister/core/services/isar_service.dart';
import 'package:wortmeister/data/models/review_history.dart';

class ReviewHistoryController {
  final IsarService isarService;

  ReviewHistoryController({required this.isarService});

  Future<void> upsertReviewHistory({
    required String deckId,
    required DateTime date,
    int reviewWordCount = 0,
    int newWordReviewCount = 0,
  }) async {
    try {
      final reviewHistories = await isarService.getItems<ReviewHistory>();
      final existingReviewHistory = reviewHistories.firstWhere(
        (rh) => rh.deckId == deckId && rh.date == date,
        orElse: () => ReviewHistory(
          reviewHistoryId: Uuid().v4(),
          deckId: deckId,
          date: date,
          reviewWordCount: 0,
          newWordReviewCount: 0,
        ),
      );

      existingReviewHistory.reviewWordCount += reviewWordCount;

      existingReviewHistory.newWordReviewCount += newWordReviewCount;

      await isarService.addItem(existingReviewHistory);
    } catch (e) {
      throw Exception('Error upserting review history: $e');
    }
  }

  // Stream of all words
  Stream<List<ReviewHistory?>> getReviewHistoryToday({
    required String deckId,
    required DateTime date,
  }) {
    try {
      return isarService.db.asStream().asyncExpand((isar) {
        return isar.reviewHistorys
            .filter()
            .dateEqualTo(date)
            .deckIdEqualTo(deckId)
            .watch(fireImmediately: true);
      });
    } catch (e) {
      throw Exception('Error streaming words: $e');
    }
  }
}

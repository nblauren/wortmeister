import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'package:wortmeister/core/services/isar_service.dart';
import 'package:wortmeister/core/services/locator_service.dart';
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
        (rh) =>
            rh.deckId == deckId &&
            rh.date == LocatorService.dateTimeService.getBeginningOfDay(date),
        orElse: () => ReviewHistory(
          reviewHistoryId: Uuid().v4(),
          deckId: deckId,
          date: LocatorService.dateTimeService.getBeginningOfDay(date),
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

  Future<ReviewHistory> getReviewHistoryToday({
    required String deckId,
    required DateTime date,
  }) async {
    try {
      final isar = await isarService.db;
      final reviewHistory = await isar.reviewHistorys
          .filter()
          .dateEqualTo(LocatorService.dateTimeService.getBeginningOfDay(date))
          .deckIdEqualTo(deckId)
          .findFirst();

      if (reviewHistory == null) {
        final newReviewHistory = ReviewHistory(
          reviewHistoryId: Uuid().v4(),
          deckId: deckId,
          date: LocatorService.dateTimeService.getBeginningOfDay(date),
          reviewWordCount: 0,
          newWordReviewCount: 0,
        );
        await isarService.addItem(newReviewHistory);
        return newReviewHistory;
      }

      return reviewHistory;
    } catch (e) {
      throw Exception('Error fetching review history: $e');
    }
  }
}

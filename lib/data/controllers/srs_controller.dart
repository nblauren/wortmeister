import 'package:isar/isar.dart';
import 'package:wortmeister/core/services/isar_service.dart';
import 'package:wortmeister/data/controllers/word_controller.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/data/models/deck_statistics_value.dart';
import 'package:wortmeister/data/models/srs.dart';
import 'package:wortmeister/data/models/srs_word.dart';

class SrsController {
  final IsarService isarService;

  SrsController({required this.isarService});

  /// Fetch daily review cards based on the user's deck settings

  /// Create a new SRS entry
  Future<void> createSrsEntry(
    String srsId,
    String userId,
    String wordId,
  ) async {
    try {
      final isar = await isarService.db;
      final srs = Srs.newEntry(srsId: srsId, userId: userId, wordId: wordId);
      await isar.writeTxn(() async {
        await isar.srs.put(srs);
      });
    } catch (e) {
      throw Exception("Failed to create SRS entry: $e");
    }
  }

  Stream<DeckStatisticsValue> getDeckStatistics(
      String userId, Deck deck) async* {
    final wordController = WordController(isarService: isarService);
    try {
      final isar = await isarService.db;
      final today = DateTime.now();

      // Watch all SRS entries for the user
      final srsEntriesStream =
          isar.srs.filter().userIdEqualTo(userId).watch(fireImmediately: true);

      await for (final srsEntries in srsEntriesStream) {
        // Filter SRS entries by deck word IDs
        final filteredSrsEntries = srsEntries.where((srs) {
          return deck.wordIds.contains(srs.wordId);
        }).toList();

        // Get words by IDs
        final wordIds = filteredSrsEntries.map((srs) => srs.wordId).toList();
        final words = await wordController.getWordsByIds(wordIds);

        // Create a list of SrsWord
        final srsWords = filteredSrsEntries.map((srs) {
          final word = words.firstWhere((word) => word.wordId == srs.wordId);
          return SrsWord(srs: srs, word: word);
        }).toList();

        // Categorize cards

        final totalCards = srsWords.length;
        final newCards =
            srsWords.where((srsWord) => srsWord.srs.reviewCount == 0).length;
        final learningCards = srsWords
            .where((srsWord) =>
                srsWord.srs.interval < 21 && srsWord.srs.reviewCount > 0)
            .length;
        final dueCards = srsWords
            .where((srsWord) =>
                srsWord.srs.nextReview.isBefore(today) ||
                srsWord.srs.nextReview.isAtSameMomentAs(today))
            .length;
        final matureCards =
            srsWords.where((srsWord) => srsWord.srs.interval >= 21).length;

        final progress = totalCards > 0
            ? ((learningCards + (matureCards * 2)) / (totalCards * 2))
            : 0;

        yield DeckStatisticsValue(
          newCards: newCards,
          learningCards: learningCards,
          dueCards: dueCards,
          matureCards: matureCards,
          progress: progress.toDouble(),
        );
      }
    } catch (e) {
      throw Exception("Failed to get card stream: $e");
    }
  }

  Stream<List<SrsWord>> getAllWordsFromDeck(String userId, Deck deck) async* {
    final wordController = WordController(isarService: isarService);
    try {
      final isar = await isarService.db;

      // Watch all SRS entries for the user
      final srsEntriesStream =
          isar.srs.filter().userIdEqualTo(userId).isDeletedEqualTo(false).watch(
                fireImmediately: true,
              );

      await for (final srsEntries in srsEntriesStream) {
        // Filter SRS entries by deck word IDs
        final filteredSrsEntries = srsEntries.where((srs) {
          return deck.wordIds.contains(srs.wordId);
        }).toList();

        // Get words by IDs
        final wordIds = filteredSrsEntries.map((srs) => srs.wordId).toList();
        final words = await wordController.getWordsByIds(wordIds);

        // Create a list of SrsWord
        final srsWords = filteredSrsEntries.map((srs) {
          final word = words.firstWhere(
              (word) => word.wordId == srs.wordId && !word.isDeleted);
          return SrsWord(srs: srs, word: word);
        }).toList();

        yield srsWords;
      }
    } catch (e) {
      throw Exception("Failed to get words from deck: $e");
    }
  }

  Future<List<SrsWord>> getReviewCards(String userId, Deck deck) async {
    final wordController = WordController(isarService: isarService);
    try {
      int dailyReviewLimit = deck.dailyReviewLimit;
      DateTime today = DateTime.now();

      // Query review words from SRS
      List<Srs> allSrs = await isarService.db.then((isar) => isar.srs
          .filter()
          .userIdEqualTo(userId)
          .nextReviewLessThan(today, include: true)
          .suspendedEqualTo(false)
          .sortByNextReview()
          .findAll());

      // Filter in Dart
      allSrs = allSrs.where((srs) {
        return deck.wordIds.any((keyword) => srs.wordId.contains(keyword));
      }).toList();

      final wordList = allSrs.map((doc) => doc.wordId).toList();
      final words = await wordController.getWordsByIds(wordList);

      return allSrs
          .take(dailyReviewLimit)
          .map((srs) => SrsWord(
              srs: srs,
              word: words.where((word) => word.wordId == srs.wordId).first))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<SrsWord>> getNewCards(String userId, Deck deck) async {
    final wordController = WordController(isarService: isarService);
    try {
      final isar = await isarService.db;

      // Query new words from SRS
      List<Srs> newSrsEntries = await isar.srs
          .filter()
          .userIdEqualTo(userId)
          .reviewCountEqualTo(0)
          .findAll();

      // Filter in Dart
      newSrsEntries = newSrsEntries.where((srs) {
        return deck.wordIds.contains(srs.wordId);
      }).toList();

      final wordList = newSrsEntries.map((srs) => srs.wordId).toList();
      final words = await wordController.getWordsByIds(wordList);

      return newSrsEntries
          .map((srs) => SrsWord(
              srs: srs,
              word: words.firstWhere((word) => word.wordId == srs.wordId)))
          .toList();
    } catch (e) {
      throw Exception("Failed to get new cards: $e");
    }
  }

  /// Update the interval, repetitions, and ease factor of a specific SRS entry
  Future<void> updateSrsEntry(
      int srsId,
      int interval,
      int repetitions,
      double easeFactor,
      DateTime lastReviewDate,
      DateTime nextReviewDate) async {
    try {
      final isar = await isarService.db;
      final srs = await isar.srs.get(srsId);
      if (srs != null) {
        srs.interval = interval;
        srs.reviewCount = repetitions;
        srs.easeFactor = easeFactor;
        srs.nextReview = nextReviewDate;
        srs.lastReviewed = lastReviewDate;
        srs.lastUpdated = DateTime.now();
        await isar.writeTxn(() async {
          await isar.srs.put(srs);
        });
      } else {
        throw Exception("SRS entry not found");
      }
    } catch (e) {
      throw Exception("Failed to update SRS entry: $e");
    }
  }
}

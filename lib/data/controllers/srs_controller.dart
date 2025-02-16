import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wortmeister/core/services/firebase_firestore_service.dart';
import 'package:wortmeister/data/controllers/word_controller.dart';
import 'package:wortmeister/data/models/srs.dart';
import 'package:wortmeister/data/models/srs_word.dart';
import 'package:wortmeister/data/models/word.dart';

class SrsController {
  final FirebaseFirestoreService firebaseService;

  SrsController({required this.firebaseService});

  /// Fetch daily review cards based on the user's deck settings
  Future<List<SrsWord>> getReviewCards(String userId, String deckId) async {
    final wordController = WordController(firebaseService: firebaseService);
    try {
      // Fetch the deck settings
      final deckSnapshot =
          await firebaseService.getCollection("decks").doc(deckId).get();
      if (!deckSnapshot.exists) {
        throw Exception("Deck not found");
      }

      Map<String, dynamic> deckData =
          deckSnapshot.data() as Map<String, dynamic>;
      int dailyReviewLimit = deckData["daily_review_limit"] ?? 50;
      Timestamp today = Timestamp.now();

      // Query review words from SRS
      QuerySnapshot reviewSnapshot = await firebaseService
          .getCollection("srs")
          .where("user_id", isEqualTo: userId)
          .where("next_review", isLessThanOrEqualTo: today)
          .where("suspended", isEqualTo: false)
          .orderBy("next_review")
          .limit(dailyReviewLimit)
          .get();

      final srsList = reviewSnapshot.docs
          .map((doc) => Srs.fromJson((doc.data() as Map<String, dynamic>)))
          .toList();
      final wordList = srsList.map((doc) => doc.wordId).toList();
      final words = await wordController.getWordsByIds(wordList);

      return srsList
          .map((srs) => SrsWord(
              srs: srs,
              word: words.where((word) => word.wordId == srs.wordId).first))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Update the interval, repetitions, and ease factor of a specific SRS entry
  Future<void> updateSrsEntry(
      String srsId, int interval, int repetitions, double easeFactor) async {
    try {
      await firebaseService.getCollection("srs").doc(srsId).update({
        'interval': interval,
        'review_count': repetitions,
        'ease_factor': easeFactor,
        'next_review':
            Timestamp.fromDate(DateTime.now().add(Duration(days: interval))),
      });
    } catch (e) {
      throw Exception("Failed to update SRS entry: $e");
    }
  }

  /// Fetch daily new cards that have not been added to SRS yet
  Future<List<Word>> getNewCards(String userId, String deckId) async {
    try {
      final wordController = WordController(firebaseService: firebaseService);
      // Fetch the deck settings
      DocumentSnapshot deckSnapshot =
          await firebaseService.getCollection("decks").doc(deckId).get();
      if (!deckSnapshot.exists) {
        throw Exception("Deck not found");
      }

      Map<String, dynamic> deckData =
          deckSnapshot.data() as Map<String, dynamic>;
      int dailyNewLimit = deckData["dailyNewLimit"] ?? 10;

      // Fetch new words that are not yet in SRS
      QuerySnapshot newWordsSnapshot = await firebaseService
          .getCollection("words")
          .where("deckId", isEqualTo: deckId)
          .where("userId", isEqualTo: userId)
          .where("srsId", isNull: true) // Only fetch words not yet added to SRS
          .orderBy("createdAt")
          .limit(dailyNewLimit)
          .get();

      final wordList = newWordsSnapshot.docs
          .map((doc) =>
              (doc.data() as Map<String, dynamic>)['word_id'] as String)
          .toList();

      return wordController.getWordsByIds(wordList);
    } catch (e) {
      return [];
    }
  }
}

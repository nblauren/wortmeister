import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wortmeister/core/services/firebase_firestore_service.dart';
import 'package:wortmeister/core/services/isar_service.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/data/models/srs.dart';
import 'package:wortmeister/data/models/word.dart';

class SyncService {
  final IsarService isar;
  final FirebaseFirestoreService firestore;

  SyncService({required this.isar, required this.firestore});

  // Get the last sync time from SharedPreferences
  Future<DateTime> getLastSyncTime() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSyncTime = prefs.getInt('lastSyncTime');
    return lastSyncTime != null
        ? DateTime.fromMillisecondsSinceEpoch(lastSyncTime)
        : DateTime(1970); // Default to a very old date
  }

  // Update the last sync time in SharedPreferences
  Future<void> setLastSyncTime(DateTime time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastSyncTime', time.millisecondsSinceEpoch);
  }

  // Sync data from Firebase to Isar
  Future<void> syncFromFirebase() async {
    final lastSyncTime = await getLastSyncTime();

    // Sync decks
    final decksSnapshot = await firestore
        .getCollection('decks')
        .where('last_updated', isGreaterThan: lastSyncTime)
        .where('user_id',
            isEqualTo: LocatorService.firebaseAuthService.currentUser()?.uid)
        .get();

    for (final deckDoc in decksSnapshot.docs) {
      final remoteDeck = Deck.fromJson(deckDoc.data() as Map<String, dynamic>);
      final remoteLastUpdated = remoteDeck.lastUpdated;

      // Check if the deck exists in Isar
      final localDeck = await (await isar.db).decks.getByDeckId(deckDoc.id);
      if (localDeck == null ||
          remoteLastUpdated.isAfter(localDeck.lastUpdated)) {
        await isar.addItem(remoteDeck);
      }

      // Sync words
      final wordIds = remoteDeck.wordIds;
      const batchSize = 30;
      for (var i = 0; i < wordIds.length; i += batchSize) {
        final batchWordIds = wordIds.sublist(
          i,
          i + batchSize > wordIds.length ? wordIds.length : i + batchSize,
        );

        final wordsSnapshot = await firestore
            .getCollection('words')
            .where('last_updated', isGreaterThan: lastSyncTime)
            .where('word_id', whereIn: batchWordIds)
            .get();

        for (final wordDoc in wordsSnapshot.docs) {
          final remoteWord =
              Word.fromJson(wordDoc.data() as Map<String, dynamic>);
          final remoteLastUpdated = remoteWord.lastUpdated;

          // Check if the word exists in Isar
          final localWord = await (await isar.db).words.getByWordId(wordDoc.id);
          if (localWord == null ||
              remoteLastUpdated.isAfter(localWord.lastUpdated)) {
            await isar.addItem(remoteWord);
          }
        }
      }
    }

    // Sync srs
    final srsSnapshot = await firestore
        .getCollection('srs')
        .where('last_updated', isGreaterThan: lastSyncTime)
        .where('user_id',
            isEqualTo: LocatorService.firebaseAuthService.currentUser()?.uid)
        .get();

    for (final srsDoc in srsSnapshot.docs) {
      final remoteSrs = Srs.fromJson(srsDoc.data() as Map<String, dynamic>);
      final remoteLastUpdated = remoteSrs.lastUpdated;

      // Check if the srs exists in Isar
      final localSrs = await (await isar.db).srs.getBySrsId(srsDoc.id);
      if (localSrs == null || remoteLastUpdated.isAfter(localSrs.lastUpdated)) {
        await isar.addItem(remoteSrs);
      }
    }
  }

  // Sync data from Isar to Firebase
  Future<void> syncToFirebase() async {
    final lastSyncTime = await getLastSyncTime();

    // Sync decks
    final decks = await (await isar.db)
        .decks
        .filter()
        .lastUpdatedGreaterThan(lastSyncTime)
        .findAll();

    for (final deck in decks) {
      final deckRef = firestore.getCollection('decks').doc(deck.deckId);

      if (deck.isDeleted) {
        await deckRef.delete();
      } else {
        await deckRef.set(deck.toJson());
      }
    }

    // Sync words
    final words = await (await isar.db)
        .words
        .filter()
        .lastUpdatedGreaterThan(lastSyncTime)
        .findAll();

    for (final word in words) {
      final wordRef = firestore.getCollection('words').doc(word.wordId);

      if (word.isDeleted) {
        await wordRef.delete();
      } else {
        // Update or add the word in Firebase
        await wordRef.set(word.toJson());
      }
    }

    // Sync words
    final srss = await (await isar.db)
        .srs
        .filter()
        .lastUpdatedGreaterThan(lastSyncTime)
        .findAll();

    for (final srs in srss) {
      final srsRef = firestore.getCollection('srs').doc(srs.srsId);

      if (srs.isDeleted) {
        await srsRef.delete();
      } else {
        // Update or add the word in Firebase
        await srsRef.set(srs.toJson());
      }
    }
  }

  // Perform a full sync (both directions)
  Future<void> fullSync() async {
    await syncFromFirebase();
    await syncToFirebase();

    // Update the last sync time
    await setLastSyncTime(DateTime.now());
  }

  // Update the last_updated field of all items in the collections in Firebase
  Future<void> updateLastUpdated() async {
    final now = DateTime.now();

    // Update decks
    final decksSnapshot = await firestore.getCollection('decks').get();
    for (final deckDoc in decksSnapshot.docs) {
      await deckDoc.reference.update({'last_updated': now});
    }

    // Update words
    final wordsSnapshot = await firestore.getCollection('words').get();
    for (final wordDoc in wordsSnapshot.docs) {
      await wordDoc.reference.update({'last_updated': now});
    }

    // Update srs
    final srsSnapshot = await firestore.getCollection('srs').get();
    for (final srsDoc in srsSnapshot.docs) {
      await srsDoc.reference.update({'last_updated': now});
    }
  }
}

import 'package:isar/isar.dart';
import 'package:wortmeister/core/services/isar_service.dart';
import 'package:wortmeister/data/models/word.dart';

class WordController {
  final IsarService isarService;

  WordController({required this.isarService});

  // Create a new word
  Future<void> createWord(Word word) async {
    try {
      await isarService.addItem(word);
    } catch (e) {
      throw Exception('Error creating word: $e');
    }
  }

  // Get a word by its ID
  Future<Word> getWord(String wordId) async {
    try {
      final isar = await isarService.db;
      final word = await isar.words.getByWordId(wordId);
      if (word != null) {
        return word;
      } else {
        throw Exception('Word not found');
      }
    } catch (e) {
      throw Exception('Error retrieving word: $e');
    }
  }

  Future<List<Word>> getWordsByIds(List<String> wordIds) async {
    if (wordIds.isEmpty) return [];

    try {
      final isar = await isarService.db;
      final words = await isar.words.getAllByWordId(wordIds);
      return words.whereType<Word>().toList();
    } catch (e) {
      return [];
    }
  }

  // Stream of all words
  Stream<List<Word>> getWordsStream(List<String> wordIds) {
    try {
      return isarService.db.asStream().asyncExpand((isar) {
        return isar.words
            .filter()
            .anyOf(wordIds, (q, String wordId) => q.wordIdEqualTo(wordId))
            .watch(fireImmediately: true);
      });
    } catch (e) {
      throw Exception('Error streaming words: $e');
    }
  }

  // Update a word
  Future<void> updateWord(Word word) async {
    try {
      final isar = await isarService.db;
      await isar.writeTxn(() async {
        await isar.words.putByWordId(word);
      });
    } catch (e) {
      throw Exception('Error updating word: $e');
    }
  }

  // Delete a word
  Future<void> deleteWord(String wordId) async {
    try {
      final isar = await isarService.db;
      await isar.writeTxn(() async {
        await isar.words.deleteByWordId(wordId);
      });
    } catch (e) {
      throw Exception('Error deleting word: $e');
    }
  }
}

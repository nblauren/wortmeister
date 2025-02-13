import 'package:wortmeister/core/services/firebase_firestore_service.dart';
import 'package:wortmeister/data/models/word.dart';

class WordController {
  final FirebaseFirestoreService firebaseService;

  WordController({required this.firebaseService});

  // Create a new word
  Future<void> createWord(Word word) async {
    try {
      await firebaseService.setDocument(
        'words/${word.word}',
        word.toJson(),
      );
    } catch (e) {
      throw Exception('Error creating word: $e');
    }
  }

  // Get a word by its ID
  Future<Word> getWord(String wordId) async {
    try {
      var docSnapshot = await firebaseService.getDocumentSnapshot(
        'words/$wordId',
      );
      if (docSnapshot.exists) {
        return Word.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Word not found');
      }
    } catch (e) {
      throw Exception('Error retrieving word: $e');
    }
  }

  // Get multiple words by their IDs
  Future<List<Word>> getWordsByIds(List<String> wordIds) async {
    try {
      var words = <Word>[];
      for (var wordId in wordIds) {
        var word = await getWord(wordId);
        words.add(word);
      }
      return words;
    } catch (e) {
      throw Exception('Error retrieving words: $e');
    }
  }

  // Update a word
  Future<void> updateWord(Word word) async {
    try {
      await firebaseService.updateDocument(
        'words/${word.word}',
        word.toJson(),
      );
    } catch (e) {
      throw Exception('Error updating word: $e');
    }
  }

  // Delete a word
  Future<void> deleteWord(String wordId) async {
    try {
      await firebaseService.deleteDocument('words/$wordId');
    } catch (e) {
      throw Exception('Error deleting word: $e');
    }
  }

  // Get all words (could be paginated if necessary)
  Future<List<Word>> getAllWords() async {
    try {
      var querySnapshot = await firebaseService.getCollectionSnapshot('words');
      return querySnapshot.docs
          .map((doc) => Word.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Error retrieving all words: $e');
    }
  }
}

import 'package:wortmeister/core/services/firebase_firestore_service.dart';
import 'package:wortmeister/data/models/srs.dart';

class SrsController {
  final FirebaseFirestoreService firebaseService;

  SrsController({required this.firebaseService});

  // Create or update SRS data for a word
  Future<void> createOrUpdateSrs(Srs srs) async {
    try {
      await firebaseService.setDocument(
        'srs/${srs.wordId}',
        srs.toJson(),
      );
    } catch (e) {
      throw Exception('Error creating/updating SRS data: $e');
    }
  }

  // Get SRS data by wordId
  Future<Srs> getSrs(String wordId) async {
    try {
      var docSnapshot = await firebaseService.getDocumentSnapshot(
        'srs/$wordId',
      );
      if (docSnapshot.exists) {
        return Srs.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('SRS data not found for word: $wordId');
      }
    } catch (e) {
      throw Exception('Error retrieving SRS data: $e');
    }
  }

  // Delete SRS data by wordId
  Future<void> deleteSrs(String wordId) async {
    try {
      await firebaseService.deleteDocument('srs/$wordId');
    } catch (e) {
      throw Exception('Error deleting SRS data: $e');
    }
  }
}

import 'package:wortmeister/core/services/firebase_firestore_service.dart';
import 'package:wortmeister/data/models/deck.dart';

class DeckController {
  final FirebaseFirestoreService firebaseService;

  DeckController({required this.firebaseService});

  // Create a new deck
  Future<void> createDeck(Deck deck) async {
    try {
      await firebaseService.setDocument(
        'decks/${deck.deckId}',
        deck.toJson(),
      );
    } catch (e) {
      throw Exception('Error creating deck: $e');
    }
  }

  // Get a deck by its ID
  Future<Deck> getDeck(String deckId) async {
    try {
      var docSnapshot = await firebaseService.getDocumentSnapshot(
        'decks/$deckId',
      );
      if (docSnapshot.exists) {
        return Deck.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Deck not found');
      }
    } catch (e) {
      throw Exception('Error retrieving deck: $e');
    }
  }

  // Update a deck
  Future<void> updateDeck(Deck deck) async {
    try {
      await firebaseService.updateDocument(
        'decks/${deck.deckId}',
        deck.toJson(),
      );
    } catch (e) {
      throw Exception('Error updating deck: $e');
    }
  }

  // Delete a deck
  Future<void> deleteDeck(String deckId) async {
    try {
      await firebaseService.deleteDocument('decks/$deckId');
    } catch (e) {
      throw Exception('Error deleting deck: $e');
    }
  }

  // Get all decks (could be paginated if necessary)
  Future<List<Deck>> getAllDecks() async {
    try {
      var querySnapshot = await firebaseService.getCollectionSnapshot('decks');
      return querySnapshot.docs
          .map((doc) => Deck.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Error retrieving all decks: $e');
    }
  }
}

import 'package:wortmeister/core/services/isar_service.dart';
import 'package:wortmeister/data/models/deck.dart';

class DeckController {
  final IsarService isarService;

  DeckController({required this.isarService});

  // Create a new deck
  Future<void> createDeck(Deck deck) async {
    try {
      await isarService.addItem(deck);
    } catch (e) {
      throw Exception('Error creating deck: $e');
    }
  }

  // Get a deck by its ID
  Future<Deck> getDeck(int deckId) async {
    try {
      final decks = await isarService.getItems<Deck>();
      final deck = decks.firstWhere((deck) => deck.id == deckId,
          orElse: () => throw Exception('Deck not found'));
      return deck;
    } catch (e) {
      throw Exception('Error retrieving deck: $e');
    }
  }

  // Update a deck
  Future<void> updateDeck(Deck deck) async {
    try {
      await isarService.addItem(deck);
    } catch (e) {
      throw Exception('Error updating deck: $e');
    }
  }

  // Delete a deck
  Future<void> deleteDeck(int deckId) async {
    try {
      await isarService.deleteItem<Deck>(deckId);
    } catch (e) {
      throw Exception('Error deleting deck: $e');
    }
  }

  // Get all decks (could be paginated if necessary)
  Future<List<Deck>> getDecks() async {
    try {
      return await isarService.getItems<Deck>();
    } catch (e) {
      throw Exception('Error retrieving decks: $e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
import 'package:wortmeister/data/models/deck.dart';

class AddDeckNotifier extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> submit(
    context, {
    Deck? deck,
    required String name,
    required String description,
    required int dailyNewLimit,
    required int dailyReviewLimit,
    required bool smartFront,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      DeckController deckController = DeckController(
        isarService: LocatorService.isarService,
      );

      if (deck == null) {
        await deckController.createDeck(
          Deck.newEntry(
            deckId: Uuid().v4(),
            userId: LocatorService.firebaseAuthService.currentUser()?.uid ?? '',
            title: name,
            description: description,
            dailyNewLimit: dailyNewLimit,
            dailyReviewLimit: dailyReviewLimit,
            createdBy:
                LocatorService.firebaseAuthService.currentUser()?.uid ?? '',
            smartFront: smartFront,
          ),
        );
      } else {
        deck.title = name;
        deck.description = description;
        deck.dailyNewLimit = dailyNewLimit;
        deck.dailyReviewLimit = dailyReviewLimit;
        deck.smartFront = smartFront;
        deck.lastUpdated = DateTime.now();
        await deckController.updateDeck(deck);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data sent successfully!')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An undefined Error happened.')),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

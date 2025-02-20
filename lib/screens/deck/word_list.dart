import 'package:flutter/material.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
import 'package:wortmeister/data/controllers/srs_controller.dart';
import 'package:wortmeister/data/models/srs_word.dart';
import 'package:wortmeister/data/models/deck.dart';

class WordList extends StatelessWidget {
  final String deckId;
  const WordList({super.key, required this.deckId});

  @override
  Widget build(BuildContext context) {
    final deckController = DeckController(
      isarService: LocatorService.isarService,
    );

    final srsController = SrsController(
      isarService: LocatorService.isarService,
    );
    return FutureBuilder<Deck>(
      future: deckController.getDeck(deckId),
      builder: (context, deckSnapshot) {
        if (deckSnapshot.hasError) {
          return SliverToBoxAdapter(
              child: Center(child: Text('Error: ${deckSnapshot.error}')));
        }

        if (deckSnapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }

        final deck = deckSnapshot.data;

        if (deck == null) {
          return SliverToBoxAdapter(
              child: Center(child: Text('Deck not found')));
        }

        return StreamBuilder<List<SrsWord>>(
          stream: srsController.getAllWordsFromDeck(
              LocatorService.firebaseAuthService.currentUser()!.uid, deck),
          builder: (context, wordSnapshot) {
            if (wordSnapshot.hasError) {
              return SliverToBoxAdapter(
                  child: Center(child: Text('Error: ${wordSnapshot.error}')));
            }

            if (wordSnapshot.connectionState == ConnectionState.waiting) {
              return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()));
            }

            final words = wordSnapshot.data;

            if (words == null || words.isEmpty) {
              return SliverToBoxAdapter(
                  child: Center(child: Text('No words yet')));
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final srsWord = words[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 1,
                    child: ListTile(
                      isThreeLine: true,
                      title: Text(srsWord.word.word),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Next review: ${LocatorService.dateTimeService.formatDate(srsWord.srs.nextReview, 'EEE, MMM dd, yyyy HH:mm')}'),
                          Text(
                              'Ease Factor: ${srsWord.srs.easeFactor}, Interval: ${srsWord.srs.interval}, Review Count: ${srsWord.srs.reviewCount}')
                        ],
                      ),
                    ),
                  );
                },
                childCount: words.length,
              ),
            );
          },
        );
      },
    );
  }
}

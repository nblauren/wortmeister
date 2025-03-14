import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/review_history_controller.dart';
import 'package:wortmeister/data/controllers/srs_controller.dart';
import 'package:wortmeister/data/models/srs.dart';
import 'package:wortmeister/data/models/srs_word.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/data/models/word.dart';
import 'package:wortmeister/widgets/word_details.dart';

class WordList extends StatelessWidget {
  final String searchWord;

  const WordList({
    super.key,
    required this.searchWord,
  });

  @override
  Widget build(BuildContext context) {
    final reviewHistoryController = ReviewHistoryController(
      isarService: LocatorService.isarService,
    );

    final srsController = SrsController(
      isarService: LocatorService.isarService,
      reviewHistoryController: reviewHistoryController,
    );

    final deck = context.read<Deck>();
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
          return SliverToBoxAdapter(child: Center(child: Text('No words yet')));
        }

        final filteredWords = words
            .where((srsWord) => srsWord.word.word
                .toLowerCase()
                .contains(searchWord.toLowerCase()))
            .toList();
        filteredWords
            .sort((a, b) => b.srs.lastUpdated.compareTo(a.srs.lastUpdated));

        if (filteredWords.isEmpty) {
          return SliverToBoxAdapter(
              child: Center(child: Text('No matching words')));
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final srsWord = filteredWords[index];
              return Card(
                elevation: 0,
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      showDragHandle: true,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WordDetails(word: srsWord.word),
                        );
                      },
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await LocatorService.isarService
                          .deleteItem<Word>(srsWord.word.id);

                      await LocatorService.isarService
                          .deleteItem<Srs>(srsWord.srs.id);
                    },
                  ),
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
            childCount: filteredWords.length,
          ),
        );
      },
    );
  }
}

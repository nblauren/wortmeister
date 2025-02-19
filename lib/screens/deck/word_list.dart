import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/word_controller.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/data/models/word.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context) {
    final deck = context.watch<Deck>();
    WordController wordController = WordController(
      isarService: LocatorService.isarService,
    );
    return FutureBuilder(
      future: wordController.getWordsByIds(deck.wordIds),
      builder: (context, AsyncSnapshot<List<Word>> snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
              child: Center(child: Text('Error: ${snapshot.error}')));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }

        final words = snapshot.data;

        if (words == null) {
          return SliverToBoxAdapter(child: Center(child: Text('No decks yet')));
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final word = words[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 1,
                child: ListTile(
                  title: Text(word.word),
                ),
              );
            },
            childCount: words.length,
          ),
        );
      },
    );
  }
}

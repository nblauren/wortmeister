import 'package:flutter/material.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
import 'package:wortmeister/data/models/deck.dart';

class DeskList extends StatelessWidget {
  const DeskList({super.key});

  @override
  Widget build(BuildContext context) {
    DeckController deckController = DeckController(
        firebaseService: LocatorService.firebaseFirestoreService);
    return StreamBuilder(
      stream: deckController.getDecksAsStream(),
      builder: (context, AsyncSnapshot<List<Deck>> snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
              child: Center(child: Text('Error: ${snapshot.error}')));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }

        final decks = snapshot.data;

        if (decks == null) {
          return SliverToBoxAdapter(child: Center(child: Text('No decks yet')));
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final deck = decks[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 1,
                child: ListTile(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/deck',
                    arguments: deck,
                  ),
                  title: Text(deck.title),
                ),
              );
            },
            childCount: decks.length,
          ),
        );
      },
    );
  }
}

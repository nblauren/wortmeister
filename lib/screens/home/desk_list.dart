import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/screens/deck/deck_statistics.dart';

class DeskList extends StatelessWidget {
  const DeskList({super.key});

  @override
  Widget build(BuildContext context) {
    DeckController deckController = DeckController(
      isarService: LocatorService.isarService,
    );
    return StreamBuilder<List<Deck>>(
      stream: deckController.watchDecks(),
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
                elevation: 0,
                child: ListTile(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/deck/${deck.deckId}',
                  ),
                  isThreeLine: true,
                  title: Text(deck.title),
                  subtitle: Provider.value(
                    value: deck,
                    child: DeckStatistics(
                      isSmall: true,
                    ),
                  ),
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

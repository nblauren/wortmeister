import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/notifiers/search_notifier.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/screens/deck/deck_statistics.dart';
import 'package:wortmeister/screens/deck/word_list.dart';

class DeckScreen extends StatelessWidget {
  final String deckId;
  const DeckScreen({super.key, required this.deckId});

  @override
  Widget build(BuildContext context) {
    final deckController = DeckController(
      isarService: LocatorService.isarService,
    );

    return ChangeNotifierProvider(
      create: (_) => SearchNotifier(),
      child: StreamBuilder(
        stream: deckController.watchDeck(deckId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          } else {
            final deck = snapshot.data as Deck;
            return Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: Text(deck.title),
                      floating: true,
                      actions: [
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/new-word',
                                arguments: deck);
                          },
                        ),
                        ElevatedButton(
                          child: Text('Practice'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/practice',
                                arguments: deck);
                          },
                        ),
                      ],
                      snap: true,
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Consumer<SearchNotifier>(
                          builder: (context, searchNotifier, child) {
                            return TextField(
                              decoration: InputDecoration(
                                labelText: 'Search',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.search),
                              ),
                              onChanged: (value) {
                                searchNotifier.updateSearchQuery(value);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Provider.value(
                        value: deck,
                        child: DeckStatistics(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Words in Deck',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Consumer<SearchNotifier>(
                      builder: (context, searchNotifier, child) {
                        return Provider.value(
                          value: deck,
                          child: WordList(
                            searchWord: searchNotifier.searchQuery,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

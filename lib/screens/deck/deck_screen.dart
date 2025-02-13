import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/screens/deck/word_list.dart';

class DeckScreen extends StatelessWidget {
  const DeckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deck = context.watch<Deck>();
    return Scaffold(
      body: CustomScrollView(
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
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
            snap: true,
          ),
          WordList(),
        ],
      ),
    );
  }
}

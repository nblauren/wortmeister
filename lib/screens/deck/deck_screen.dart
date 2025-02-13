import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/data/models/deck.dart';

class DeckScreen extends StatelessWidget {
  const DeckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deck = context.watch<Deck>();
    return Scaffold(
      appBar: AppBar(
        title: Text(deck.title),
      ),
      body: Center(
        child: Text('Welcome to the Deck Screen!'),
      ),
    );
  }
}

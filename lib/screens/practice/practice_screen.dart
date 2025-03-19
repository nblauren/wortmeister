import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/screens/practice/word_gallery.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deck = context.watch<Deck>();
    return Scaffold(
      appBar: AppBar(
        title: Text(deck.title),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: WordGallery()),
        ],
      )),
    );
  }
}

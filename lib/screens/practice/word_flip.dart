import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/data/models/word.dart';
import 'package:wortmeister/widgets/word_details.dart';

class WordFlip extends StatefulWidget {
  const WordFlip({super.key});

  @override
  State<WordFlip> createState() => _WordFlipState();
}

class _WordFlipState extends State<WordFlip> {
  late String frontFinal;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final word = context.watch<Word>();
    final deck = context.watch<Deck>();
    final front1 = word.word.contains(' ') &&
            word.word.split(' ').length == 2 &&
            ['der', 'die', 'das'].contains(word.word.split(' ').first)
        ? word.word.split(' ').skip(1).join(' ')
        : word.word;

    final front2 =
        '${word.meanings?.first.definition} / ${word.meanings?.first.definitionEn}';

    frontFinal = deck.smartFront
        ? (DateTime.now().millisecondsSinceEpoch % 2 == 0)
            ? front2
            : front1
        : front1;
  }

  @override
  Widget build(BuildContext context) {
    final word = context.watch<Word>();

    return FlipCard(
      speed: 200,
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.FRONT, // The side to initially display.
      front: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AutoSizeText(
              frontFinal,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      back: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: WordDetails(
            word: word,
          ),
        ),
      ),
    );
  }
}

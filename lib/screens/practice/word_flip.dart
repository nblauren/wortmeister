import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/data/models/word.dart';
import 'package:wortmeister/widgets/word_details.dart';

class WordFlip extends StatelessWidget {
  const WordFlip({super.key});

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
            child: Text(
          word.word.contains(' ') && word.word.split(' ').length < 3
              ? word.word.split(' ').skip(1).join(' ')
              : word.word,
          style: TextStyle(fontSize: 50),
        )),
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

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/data/models/word.dart';

class WordFlip extends StatelessWidget {
  const WordFlip({super.key});

  @override
  Widget build(BuildContext context) {
    final word = context.watch<Word>();

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: FlipCard(
        speed: 200,
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        side: CardSide.FRONT, // The side to initially display.
        front: Card(
          child: Center(
              child: Text(
            word.word.contains(' ')
                ? word.word.split(' ').skip(1).join(' ')
                : word.word,
            style: TextStyle(fontSize: 50),
          )),
        ),
        back: SizedBox(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Column(
                    children: [
                      Text(
                        word.word,
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        word.gender ?? '',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 16,
                  ),
                  ...word.meanings.map(
                    (meaning) => Column(
                      children: [
                        Text(
                          meaning.context ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          meaning.definition,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          meaning.definitionEn,
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

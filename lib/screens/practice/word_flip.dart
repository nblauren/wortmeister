import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/data/models/word.dart';
import 'package:wortmeister/widgets/speak_button.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          word.word,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        if (word.gender != null)
                          Text(
                            word.gender!,
                            style: TextStyle(fontSize: 12),
                          ),
                      ],
                    ),
                  ),
                  PlayButton(word: word.word),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              if (word.back != null)
                Text(
                  word.back!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32),
                ),
              if (word.meanings != null)
                ...word.meanings!.map(
                  (meaning) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        meaning.context ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (meaning.definition != null)
                        Text(
                          meaning.definition!,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      if (meaning.definitionEn != null)
                        Text(
                          meaning.definitionEn!,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      if (meaning.exampleSentences != null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text('Beispiel:'),
                            ...meaning.exampleSentences!.map((e) => Text(e)),
                          ],
                        )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wortmeister/data/models/word.dart';
import 'package:wortmeister/widgets/speak_button.dart';

class WordDetails extends StatelessWidget {
  final Word word;

  const WordDetails({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
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
                      if (word.plural != null)
                        Text(
                          word.plural!,
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
                    if (meaning.exampleSentences != null &&
                        meaning.exampleSentences!.isNotEmpty)
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
                      ),
                    if (meaning.synonyms != null &&
                        meaning.synonyms!.isNotEmpty)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Text('Synonym:'),
                          Text(meaning.synonyms!.join(',')),
                        ],
                      ),
                    if (meaning.antonyms != null &&
                        meaning.antonyms!.isNotEmpty)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Text('antonyms:'),
                          Text(meaning.antonyms!.join(',')),
                        ],
                      ),
                    Divider(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

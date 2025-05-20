import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/core/services/openai_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
import 'package:wortmeister/data/controllers/review_history_controller.dart';
import 'package:wortmeister/data/controllers/srs_controller.dart';
import 'package:wortmeister/data/controllers/word_controller.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/data/models/meaning.dart';
import 'package:wortmeister/data/models/word.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  State<AddWordScreen> createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyManual = GlobalKey<FormState>();
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _frontController = TextEditingController();
  final TextEditingController _backController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitForm(context) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final deck = Provider.of<Deck>(context, listen: false);

      final key = LocatorService.firebaseRemoteConfig.getString('openai_key');
      final prompt =
          LocatorService.firebaseRemoteConfig.getString('openai_prompt');
      String jsonString =
          await rootBundle.loadString('assets/data/structure.json');
      final structure = jsonDecode(jsonString);

      WordController wordController = WordController(
        isarService: LocatorService.isarService,
      );
      DeckController deckController = DeckController(
        isarService: LocatorService.isarService,
      );
      final reviewHistoryController = ReviewHistoryController(
        isarService: LocatorService.isarService,
      );

      final srsController = SrsController(
        isarService: LocatorService.isarService,
        reviewHistoryController: reviewHistoryController,
      );

      final openAIService = OpenAIService(key);

      final result = await openAIService.getCompletionWithStructuredOutput(
          prompt, _wordController.text, structure);

      if (result.choices.first.message.content != null) {
        final newWordId = Uuid().v4();
        final wordJson = jsonDecode(result.choices.first.message.content!);
        wordJson['word_id'] = newWordId;
        wordJson['created_by'] =
            LocatorService.firebaseAuthService.currentUser()!.uid;
        final word = Word.fromJson(wordJson);
        await wordController.createWord(word);

        // add word to deck
        final wordsIds = deck.wordIds.toList();
        wordsIds.add(newWordId);
        deck.wordIds = wordsIds;
        deck.lastUpdated = DateTime.now();
        await deckController.updateDeck(deck);

        // add srs
        final newSrsId = Uuid().v4();
        srsController.createSrsEntry(
          newSrsId,
          LocatorService.firebaseAuthService.currentUser()!.uid,
          newWordId,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Word added!'),
            duration: Duration(seconds: 1),
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending data: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _submitManualForm(context) async {
    if (!_formKeyManual.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final deck = Provider.of<Deck>(context, listen: false);

      final wordController = WordController(
        isarService: LocatorService.isarService,
      );
      final deckController = DeckController(
        isarService: LocatorService.isarService,
      );
      final reviewHistoryController = ReviewHistoryController(
        isarService: LocatorService.isarService,
      );

      final srsController = SrsController(
        isarService: LocatorService.isarService,
        reviewHistoryController: reviewHistoryController,
      );

      final newWordId = Uuid().v4();
      Word newWord = Word(
        wordId: newWordId,
        word: _frontController.text,
        back: _backController.text,
        language: 'de',
        createdBy: LocatorService.firebaseAuthService.currentUser()!.uid,
        lastUpdated: DateTime.now(),
      );

      await wordController.createWord(newWord);

      // add word to deck
      final wordsIds = deck.wordIds.toList();
      wordsIds.add(newWordId);
      deck.wordIds = wordsIds;
      deck.lastUpdated = DateTime.now();
      await deckController.updateDeck(deck);

      // add srs
      final newSrsId = Uuid().v4();
      srsController.createSrsEntry(
        newSrsId,
        LocatorService.firebaseAuthService.currentUser()!.uid,
        newWordId,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Word added!'),
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending data: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _submitAuto(context) async {
    setState(() => _isLoading = true);

    try {
      final deck = Provider.of<Deck>(context, listen: false);

      final wordController = WordController(
        isarService: LocatorService.isarService,
      );
      final deckController = DeckController(
        isarService: LocatorService.isarService,
      );
      final reviewHistoryController = ReviewHistoryController(
        isarService: LocatorService.isarService,
      );

      final srsController = SrsController(
        isarService: LocatorService.isarService,
        reviewHistoryController: reviewHistoryController,
      );

      String wordList = await rootBundle.loadString(
        'assets/data/german_verb_noun_csv.csv',
      );

      List<List<dynamic>> rowsAsListOfValues =
          const CsvToListConverter().convert(wordList, eol: '\n');
      for (var parts in rowsAsListOfValues) {
        final raw = parts[0].trim();
        final complete = parts[1].trim();
        final akkdat = parts[2].trim();
        final meaningde = parts[3].trim();
        final meaningeng = parts[4].trim();
        final exmpl1 = parts[5].trim();
        final exmpl2 = parts[6].trim();

        final newWordId = Uuid().v4();
        Word newWord = Word(
          wordId: newWordId,
          word: '$raw',
          meanings: [
            Meaning(
              exampleSentences: [exmpl1, exmpl2],
              definition: meaningde,
              definitionEn: meaningeng,
            )
          ],
          language: 'de',
          createdBy: LocatorService.firebaseAuthService.currentUser()!.uid,
          lastUpdated: DateTime.now(),
        );

        await wordController.createWord(newWord);

        // add word to deck
        final wordsIds = deck.wordIds.toList();
        wordsIds.add(newWordId);
        deck.wordIds = wordsIds;
        deck.lastUpdated = DateTime.now();
        await deckController.updateDeck(deck);

        // add srs
        final newSrsId = Uuid().v4();
        await srsController.createSrsEntry(
          newSrsId,
          LocatorService.firebaseAuthService.currentUser()!.uid,
          newWordId,
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Word added!'),
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending data: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Word'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Search'),
                Tab(text: 'Manual'),
                Tab(text: 'Data'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _wordController,
                        decoration: InputDecoration(labelText: 'Enter a word'),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter a word'
                            : null,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed:
                            _isLoading ? null : () => _submitForm(context),
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKeyManual,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _frontController,
                        decoration: InputDecoration(labelText: 'Enter a word'),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter a word'
                            : null,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _backController,
                        decoration: InputDecoration(labelText: 'Enter answer'),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter answer'
                            : null,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _isLoading
                            ? null
                            : () => _submitManualForm(context),
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKeyManual,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed:
                            _isLoading ? null : () => _submitAuto(context),
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

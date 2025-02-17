import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/core/services/openai_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
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
          firebaseService: LocatorService.firebaseFirestoreService);
      DeckController deckController = DeckController(
          firebaseService: LocatorService.firebaseFirestoreService);
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
        deck.wordIds.add(newWordId);
        await deckController.updateDeck(deck);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data sent successfully!')),
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

      WordController wordController = WordController(
          firebaseService: LocatorService.firebaseFirestoreService);
      DeckController deckController = DeckController(
          firebaseService: LocatorService.firebaseFirestoreService);

      final newWordId = Uuid().v4();
      Word newWord = Word(
        wordId: newWordId,
        word: _frontController.text,
        back: _backController.text,
        language: 'de',
        createdBy: LocatorService.firebaseAuthService.currentUser()!.uid,
      );

      await wordController.createWord(newWord);

      // add word to deck
      deck.wordIds.add(newWordId);
      await deckController.updateDeck(deck);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data sent successfully!')),
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

      WordController wordController = WordController(
          firebaseService: LocatorService.firebaseFirestoreService);
      DeckController deckController = DeckController(
          firebaseService: LocatorService.firebaseFirestoreService);

      String wordList = await rootBundle.loadString('assets/data/verbs.txt');

      List<String> lines = LineSplitter().convert(wordList);
      for (String line in lines) {
        final parts = line.split('/');
        final word = parts[0].trim();
        final meaning = parts[1].trim();
        final pret = parts[2].trim();
        final past = parts[3].trim();

        final newWordId = Uuid().v4();
        Word newWord = Word(
          wordId: newWordId,
          word: word,
          meanings: [
            Meaning(partOfSpeech: '', definition: '', definitionEn: meaning)
          ],
          back: '$pret / $past',
          language: 'de',
          createdBy: LocatorService.firebaseAuthService.currentUser()!.uid,
        );

        await wordController.createWord(newWord);

        // add word to deck
        deck.wordIds.add(newWordId);
        await deckController.updateDeck(deck);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data sent successfully!')),
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

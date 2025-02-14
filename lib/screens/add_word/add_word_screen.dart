import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/core/services/openai_service.dart';
import 'package:wortmeister/data/controllers/word_controller.dart';
import 'package:wortmeister/data/models/word.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  State<AddWordScreen> createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _wordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitForm(context) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final key = LocatorService.firebaseRemoteConfig.getString('openai_key');
      final prompt =
          LocatorService.firebaseRemoteConfig.getString('openai_prompt');
      String jsonString =
          await rootBundle.loadString('assets/data/structure.json');
      final structure = jsonDecode(jsonString);

      WordController wordController = WordController(
          firebaseService: LocatorService.firebaseFirestoreService);
      final openAIService = OpenAIService(key);

      final result = await openAIService.getCompletionWithStructuredOutput(
          prompt, 'German Word is ${_wordController.text}', structure);

      if (result.choices.first.message.content != null) {
        final wordJson = jsonDecode(result.choices.first.message.content!);
        wordJson['word_id'] = Uuid().v4();
        final word = Word.fromJson(wordJson);
        await wordController.createWord(word);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Word'),
      ),
      body: Padding(
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
                onPressed: _isLoading ? null : () => _submitForm(context),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

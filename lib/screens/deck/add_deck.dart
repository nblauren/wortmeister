import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
import 'package:wortmeister/data/models/deck.dart';

class AddDeckNotifier extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> submit(
    context, {
    required String name,
    required String description,
    required int dailyNewLimit,
    required int dailyReviewLimit,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      DeckController deckController = DeckController(
        isarService: LocatorService.isarService,
      );
      await deckController.createDeck(
        Deck.newEntry(
          deckId: Uuid().v4(),
          userId: LocatorService.firebaseAuthService.currentUser()?.uid ?? '',
          title: name,
          description: '',
          dailyNewLimit: dailyNewLimit,
          dailyReviewLimit: dailyReviewLimit,
          createdBy:
              LocatorService.firebaseAuthService.currentUser()?.uid ?? '',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data sent successfully!')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      _errorMessage = 'An undefined Error happened.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class AddDeck extends StatelessWidget {
  AddDeck({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _deckNameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _dailyNewWordsLimit = TextEditingController();

  final TextEditingController _dailyReviewLimit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _dailyReviewLimit.text = '200';
    _dailyNewWordsLimit.text = '50';
    return ChangeNotifierProvider(
      create: (_) => AddDeckNotifier(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _deckNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter a name'
                      : null,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _dailyNewWordsLimit,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Daily new word limit',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _dailyReviewLimit,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Daily review limit',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Consumer<AddDeckNotifier>(
                    builder: (_, addDeckNotifier, __) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            await addDeckNotifier.submit(
                              context,
                              name: _deckNameController.text,
                              description: _descriptionController.text,
                              dailyNewLimit:
                                  int.parse(_dailyNewWordsLimit.text),
                              dailyReviewLimit:
                                  int.parse(_dailyReviewLimit.text),
                            );
                          }
                        },
                        child: addDeckNotifier._isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('Submit'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/notifiers/add_deck_notifier.dart';
import 'package:wortmeister/data/models/deck.dart';

class AddDeck extends StatefulWidget {
  const AddDeck({super.key});

  @override
  State<AddDeck> createState() => _AddDeckState();
}

class _AddDeckState extends State<AddDeck> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _deckNameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _dailyNewWordsLimit = TextEditingController();

  final TextEditingController _dailyReviewLimit = TextEditingController();

  bool _isSmartFront = false;

  @override
  Widget build(BuildContext context) {
    final deck = context.watch<Deck?>();
    if (deck != null) {
      _deckNameController.text = deck.title;
      _descriptionController.text = deck.description;
      _dailyNewWordsLimit.text = deck.dailyNewLimit.toString();
      _dailyReviewLimit.text = deck.dailyReviewLimit.toString();
      setState(() {
        _isSmartFront = deck.smartFront;
      });
    } else {
      _dailyReviewLimit.text = '200';
      _dailyNewWordsLimit.text = '50';
    }
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
                // Checkbox
                FormField<bool>(
                  initialValue: _isSmartFront,
                  builder: (field) {
                    return CheckboxListTile(
                      title: Text("Smart Front"),
                      value: field.value,
                      onChanged: (value) {
                        field.didChange(value);
                        _isSmartFront = value ?? false;
                      },
                    );
                  },
                ),

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
                              deck: deck,
                              name: _deckNameController.text,
                              description: _descriptionController.text,
                              dailyNewLimit:
                                  int.parse(_dailyNewWordsLimit.text),
                              dailyReviewLimit:
                                  int.parse(_dailyReviewLimit.text),
                              smartFront: _isSmartFront,
                            );
                          }
                        },
                        child: addDeckNotifier.isLoading
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

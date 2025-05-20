import 'package:flutter/material.dart';

class ImportDeckWidget extends StatelessWidget {
  const ImportDeckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Deck ID',
            ),
            maxLines: null,
          ),
        ),
      ),
    );
  }
}

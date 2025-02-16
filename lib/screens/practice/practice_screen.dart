import 'package:flutter/material.dart';
import 'package:wortmeister/screens/practice/word_gallery.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Screen'),
      ),
      body: WordGallery(),
    );
  }
}

import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Practice Screen!'),
      ),
    );
  }
}

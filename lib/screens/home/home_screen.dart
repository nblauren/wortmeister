import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/new-deck'),
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

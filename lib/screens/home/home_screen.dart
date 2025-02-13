import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/firebase_auth_service.dart';
import 'package:wortmeister/screens/home/desk_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180.0,
            floating: true,
            pinned: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 13, bottom: 13, right: 13),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Decks",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            "Pick a category to practice",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton.filled(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/new-deck'),
                        icon: Icon(Icons.add))
                  ],
                ),
                centerTitle: false,
                background: Container(
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              IconButton(
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                onPressed: () async {
                  await Provider.of<FirebaseAuthService>(context, listen: false)
                      .signOut();
                },
              ),
            ],
          ),
          DeskList(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/screens/deck/add_deck.dart';
import 'package:wortmeister/screens/home/desk_list.dart';
import 'package:wortmeister/widgets/import_deck.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180.0,
            floating: true,
            pinned: true,
            stretch: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.import_export, color: Colors.white),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    showDragHandle: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImportDeckWidget(),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.sync, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/sync');
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              IconButton(
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                onPressed: () async {
                  await LocatorService.firebaseAuthService.signOut();
                },
              ),
            ],
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
                  ],
                ),
                centerTitle: false,
                background: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          DeskList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            builder: (BuildContext context) {
              return Provider<Deck?>.value(
                value: null,
                child: AddDeck(),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

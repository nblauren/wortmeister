import 'package:flutter/material.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/deck_controller.dart';
import 'package:wortmeister/data/controllers/srs_controller.dart';
import 'package:wortmeister/data/models/deck_statistics_value.dart';
import 'package:wortmeister/data/models/deck.dart';

class DeckStatistics extends StatelessWidget {
  final String deckId;
  const DeckStatistics({super.key, required this.deckId});

  @override
  Widget build(BuildContext context) {
    final deckController = DeckController(
      isarService: LocatorService.isarService,
    );

    final srsController = SrsController(
      isarService: LocatorService.isarService,
    );
    return FutureBuilder<Deck>(
      future: deckController.getDeck(deckId),
      builder: (context, deckSnapshot) {
        if (deckSnapshot.hasError) {
          return Center(child: Text('Error: ${deckSnapshot.error}'));
        }

        if (deckSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final deck = deckSnapshot.data;

        if (deck == null) {
          return Center(child: Text('Deck not found'));
        }

        return StreamBuilder<DeckStatisticsValue>(
          stream: srsController.getDeckStatistics(
              LocatorService.firebaseAuthService.currentUser()!.uid, deck),
          builder: (context, deckStatisticsSnapshot) {
            if (deckStatisticsSnapshot.hasError) {
              return Center(
                  child: Text('Error: ${deckStatisticsSnapshot.error}'));
            }

            if (deckStatisticsSnapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final deckStatisticsValue = deckStatisticsSnapshot.data;

            if (deckStatisticsValue == null) {
              return Center(child: Text('No words yet'));
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = (constraints.maxWidth - 48.0) /
                    2; // 16.0 spacing * 3 gaps / 2 cards per row
                return Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    _buildStatisticCard(
                        'New', deckStatisticsValue.newCards, Colors.blue),
                    _buildStatisticCard('Learning',
                        deckStatisticsValue.learningCards, Colors.orange),
                    _buildStatisticCard(
                        'Due', deckStatisticsValue.dueCards, Colors.red),
                    _buildStatisticCard('Mature',
                        deckStatisticsValue.matureCards, Colors.green),
                  ]
                      .map((card) => SizedBox(width: cardWidth, child: card))
                      .toList(),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildStatisticCard(String title, int count, Color color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

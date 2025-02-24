import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/srs_controller.dart';
import 'package:wortmeister/data/models/deck_statistics_value.dart';
import 'package:wortmeister/data/models/deck.dart';

class DeckStatistics extends StatelessWidget {
  const DeckStatistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deck = context.read<Deck>();
    final srsController = SrsController(
      isarService: LocatorService.isarService,
    );
    return StreamBuilder<DeckStatisticsValue>(
      stream: srsController.getDeckStatistics(
          LocatorService.firebaseAuthService.currentUser()!.uid, deck),
      builder: (context, deckStatisticsSnapshot) {
        if (deckStatisticsSnapshot.hasError) {
          return Center(child: Text('Error: ${deckStatisticsSnapshot.error}'));
        }

        if (deckStatisticsSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final deckStatisticsValue = deckStatisticsSnapshot.data;

        if (deckStatisticsValue == null) {
          return Center(child: Text('No words yet'));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: deckStatisticsValue.progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildStatisticCard(
                    'New', deckStatisticsValue.newCards, Colors.blue),
                _buildStatisticCard('Learning',
                    deckStatisticsValue.learningCards, Colors.orange),
                _buildStatisticCard(
                    'Due', deckStatisticsValue.dueCards, Colors.red),
                _buildStatisticCard(
                    'Mature', deckStatisticsValue.matureCards, Colors.green),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatisticCard(String title, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

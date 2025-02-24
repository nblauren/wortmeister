class DeckStatisticsValue {
  final int newCards;
  final int learningCards;
  final int dueCards;
  final int matureCards;
  final double progress;

  DeckStatisticsValue({
    required this.newCards,
    required this.learningCards,
    required this.dueCards,
    required this.matureCards,
    required this.progress,
  });
}

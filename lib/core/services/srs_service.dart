import 'package:wortmeister/data/models/new_srs.dart';

class SrsService {
  // Singleton pattern
  static final SrsService _instance = SrsService._internal();
  List<int> learningSteps = [1, 10, 1440];

  factory SrsService() {
    return _instance;
  }

  SrsService._internal();
  // Method to compute SRS like Anki
  NewSrs calculateNextReviewDate({
    required DateTime lastReviewDate,
    required int interval,
    required double easeFactor,
    required int repetition,
    required int quality,
    required int learningStep,
  }) {
    DateTime now = DateTime.now();
    double newEaseFactor = easeFactor;
    int newInterval = interval;
    int newRepetition = repetition + 1;
    int newLearningStep = learningStep;

    // Handle Learning Phase
    if (repetition == 0 || interval < 1) {
      if (quality == 0) {
        newLearningStep = 0; // Reset to first step
      } else if (quality == 1 && newLearningStep < learningSteps.length) {
        newLearningStep++; // Move to the next step
      } else if (quality == 2) {
        newInterval = 1; // Graduate to review mode with 1-day interval
        newRepetition = 1;
      } else if (quality == 3) {
        newInterval = 3; // Graduate with a 3-day interval
        newRepetition = 1;
      }

      if (newLearningStep < learningSteps.length) {
        final nextReviewDate =
            now.add(Duration(minutes: learningSteps[newLearningStep]));
        return NewSrs(
          easeFactor: newEaseFactor,
          interval: newInterval,
          repetition: newRepetition,
          nextReview: nextReviewDate,
          learningStep: newLearningStep,
        );
      }
    }

    // Handle Review Phase
    switch (quality) {
      case 0: // "Again"
        newInterval = 1;
        newEaseFactor = (easeFactor - 0.2).clamp(1.3, 2.5);
        newRepetition = 0;
        break;
      case 1: // "Hard"
        newInterval = (interval * 1.2).round();
        newEaseFactor = (easeFactor - 0.15).clamp(1.3, 2.5);
        break;
      case 2: // "Good"
        newInterval = (interval * easeFactor).round();
        break;
      case 3: // "Easy"
        newInterval = (interval * easeFactor * 1.3).round();
        newEaseFactor = (easeFactor + 0.15).clamp(1.3, 2.5);
        break;
    }

    final nextReviewDate = lastReviewDate.add(Duration(days: newInterval));
    return NewSrs(
      easeFactor: newEaseFactor,
      interval: newInterval,
      repetition: newRepetition,
      nextReview: nextReviewDate,
      learningStep: newLearningStep,
    );
  }
}

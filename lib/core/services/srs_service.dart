import 'package:wortmeister/data/models/newSrs.dart';

class SrsService {
  // Singleton pattern
  static final SrsService _instance = SrsService._internal();

  factory SrsService() {
    return _instance;
  }

  SrsService._internal();
  // Method to compute SRS like Anki
  NewSrs calculateNextReviewDate(
      {required DateTime lastReviewDate,
      required int interval,
      required double easeFactor,
      required int repition,
      required int quality}) {
    double newEaseFactor = easeFactor;
    int newInterval = interval;
    int newRepetition = repition + 1;

    // SM-2 Algorithm Adjustments Based on Quality
    switch (quality) {
      case 0: // "Again" (Forgot)
        newInterval = 1; // Reset to 1 day
        newEaseFactor = (easeFactor - 0.2).clamp(1.3, 2.5); // Minimum EF is 1.3
        newRepetition = 0; // Reset repetition count
        break;
      case 1: // "Hard"
        newInterval = (interval * 1.2).round(); // Slight increase
        newEaseFactor = (easeFactor - 0.15).clamp(1.3, 2.5);
        break;
      case 2: // "Good"
        newInterval = (interval * easeFactor).round();
        break;
      case 3: // "Easy"
        newInterval = (interval * easeFactor * 1.3).round(); // Boosted interval
        newEaseFactor = (easeFactor + 0.15).clamp(1.3, 2.5);
        break;
    }

    // Compute new review date
    final nextReviewDate = lastReviewDate.add(Duration(days: newInterval));
    return NewSrs(
      easeFactor: newEaseFactor,
      interval: newInterval,
      repitition: newRepetition,
      nextReview: nextReviewDate,
    );
  }
}

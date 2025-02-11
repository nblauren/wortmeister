class Srs {
  final String wordId;
  final DateTime nextReviewDate;
  final int interval;
  final int repetitions;
  final double easeFactor;

  Srs({
    required this.wordId,
    required this.nextReviewDate,
    required this.interval,
    required this.repetitions,
    required this.easeFactor,
  });

  factory Srs.fromJson(Map<String, dynamic> json) {
    return Srs(
      wordId: json['word_id'],
      nextReviewDate: DateTime.parse(json['next_review_date']),
      interval: json['interval'],
      repetitions: json['repetitions'],
      easeFactor: json['ease_factor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word_id': wordId,
      'next_review_date': nextReviewDate.toIso8601String(),
      'interval': interval,
      'repetitions': repetitions,
      'ease_factor': easeFactor,
    };
  }
}

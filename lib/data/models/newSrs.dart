import 'package:cloud_firestore/cloud_firestore.dart';

class NewSrs {
  final DateTime nextReview;
  final int interval;
  final double easeFactor;
  final int repitition;

  NewSrs({
    required this.nextReview,
    required this.interval,
    required this.easeFactor,
    required this.repitition,
  });
}

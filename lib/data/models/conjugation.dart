import 'package:isar/isar.dart';

part 'conjugation.g.dart';

@Embedded()
class Conjugation {
  String? present;
  String? past;
  String? perfect;
  String? pastParticiple;
  String? auxiliaryVerb;

  Conjugation({
    this.present,
    this.past,
    this.perfect,
    this.pastParticiple,
    this.auxiliaryVerb,
  });

  factory Conjugation.fromJson(Map<String, dynamic> json) {
    return Conjugation(
      present: json['present'],
      past: json['past'],
      perfect: json['perfect'],
      pastParticiple: json['past_participle'],
      auxiliaryVerb: json['auxiliary_verb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'present': present,
      'past': past,
      'perfect': perfect,
      'past_participle': pastParticiple,
      'auxiliary_verb': auxiliaryVerb,
    };
  }
}

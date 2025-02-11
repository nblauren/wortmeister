class Conjugation {
  final Map<String, String> present;
  final Map<String, String> past;
  final Map<String, String> perfect;
  final Map<String, String> pastParticiple;
  final String auxiliaryVerb;

  Conjugation({
    required this.present,
    required this.past,
    required this.perfect,
    required this.pastParticiple,
    required this.auxiliaryVerb,
  });

  factory Conjugation.fromJson(Map<String, dynamic> json) {
    return Conjugation(
      present: Map<String, String>.from(json['present']),
      past: Map<String, String>.from(json['past']),
      perfect: Map<String, String>.from(json['perfect']),
      pastParticiple: Map<String, String>.from(json['past_participle']),
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

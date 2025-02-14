class Conjugation {
  final String present;
  final String past;
  final String perfect;
  final String pastParticiple;
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

class Meaning {
  final String? context;
  final String partOfSpeech;
  final String definition;
  final String definitionEn;
  final List<String>? exampleSentences;
  final List<String>? synonyms;
  final List<String>? antonyms;

  Meaning({
    this.context,
    required this.partOfSpeech,
    required this.definition,
    required this.definitionEn,
    this.exampleSentences,
    this.synonyms,
    this.antonyms,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      context: json['context'],
      partOfSpeech: json['part_of_speech'],
      definition: json['definition'],
      definitionEn: json['definition_en'],
      exampleSentences: json['example_sentences'] != null
          ? List<String>.from(json['example_sentences'].map((x) => x))
          : null,
      synonyms: json['synonyms'] != null
          ? List<String>.from(json['synonyms'].map((x) => x))
          : null,
      antonyms: json['antonyms'] != null
          ? List<String>.from(json['antonyms'].map((x) => x))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'context': context,
      'part_of_speech': partOfSpeech,
      'definition': definition,
      'definition_en': definitionEn,
      'example_sentences': exampleSentences,
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }
}

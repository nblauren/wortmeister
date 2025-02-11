class Meaning {
  final String context;
  final String partOfSpeech;
  final String definition;
  final List<String> exampleSentences;
  final List<String> synonyms;
  final List<String> antonyms;

  Meaning({
    required this.context,
    required this.partOfSpeech,
    required this.definition,
    required this.exampleSentences,
    required this.synonyms,
    required this.antonyms,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      context: json['context'],
      partOfSpeech: json['part_of_speech'],
      definition: json['definition'],
      exampleSentences:
          List<String>.from(json['example_sentences'].map((x) => x)),
      synonyms: List<String>.from(json['synonyms'].map((x) => x)),
      antonyms: List<String>.from(json['antonyms'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'context': context,
      'part_of_speech': partOfSpeech,
      'definition': definition,
      'example_sentences': exampleSentences,
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }
}

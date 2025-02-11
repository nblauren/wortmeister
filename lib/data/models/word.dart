import 'package:wortmeister/data/models/conjugation.dart';
import 'package:wortmeister/data/models/meaning.dart';

class Word {
  final String wordId;
  final String word;
  final String language;
  final String pronunciation;
  final String plural;
  final String gender;
  final String article;
  final List<Meaning> meanings;
  final Conjugation conjugation;
  final String comparative;
  final String superlative;
  final List<String> relatedWords;
  final String difficultyLevel;

  Word({
    required this.wordId,
    required this.word,
    required this.language,
    required this.pronunciation,
    required this.plural,
    required this.gender,
    required this.article,
    required this.meanings,
    required this.conjugation,
    required this.comparative,
    required this.superlative,
    required this.relatedWords,
    required this.difficultyLevel,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      wordId: json['word_id'],
      word: json['word'],
      language: json['language'],
      pronunciation: json['pronunciation'],
      plural: json['plural'],
      gender: json['gender'],
      article: json['article'],
      meanings:
          List<Meaning>.from(json['meanings'].map((x) => Meaning.fromJson(x))),
      conjugation: Conjugation.fromJson(json['conjugation']),
      comparative: json['comparative'],
      superlative: json['superlative'],
      relatedWords: List<String>.from(json['related_words']),
      difficultyLevel: json['difficulty_level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word_id': wordId,
      'word': word,
      'language': language,
      'pronunciation': pronunciation,
      'plural': plural,
      'gender': gender,
      'article': article,
      'meanings': List<dynamic>.from(meanings.map((x) => x.toJson())),
      'conjugation': conjugation.toJson(),
      'comparative': comparative,
      'superlative': superlative,
      'related_words': relatedWords,
      'difficulty_level': difficultyLevel,
    };
  }
}

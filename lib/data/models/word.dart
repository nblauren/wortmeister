import 'package:wortmeister/data/models/conjugation.dart';
import 'package:wortmeister/data/models/meaning.dart';

class Word {
  final String wordId;
  final String word;
  final String language;
  final String? pronunciation;
  final String? plural;
  final String? gender;
  final String? article;
  final List<Meaning>? meanings;
  final Conjugation? conjugation;
  final String? comparative;
  final String? superlative;
  final List<String>? relatedWords;
  final String? difficultyLevel;
  final String createdBy;
  final String? back;

  Word({
    required this.wordId,
    required this.word,
    required this.language,
    this.pronunciation,
    this.plural,
    this.gender,
    this.article,
    this.meanings,
    this.conjugation,
    this.comparative,
    this.superlative,
    this.relatedWords,
    this.difficultyLevel,
    required this.createdBy,
    this.back,
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
      meanings: json['meanings'] != null
          ? List<Meaning>.from(json['meanings'].map((x) => Meaning.fromJson(x)))
          : null,
      conjugation: json['conjugation'] != null
          ? Conjugation.fromJson(json['conjugation'])
          : null,
      comparative: json['comparative'],
      superlative: json['superlative'],
      relatedWords: json['related_words'] != null
          ? List<String>.from(json['related_words'])
          : null,
      difficultyLevel: json['difficulty_level'],
      createdBy: json['created_by'],
      back: json['back'],
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
      'meanings': meanings != null
          ? List<dynamic>.from(meanings!.map((x) => x.toJson()))
          : null,
      'conjugation': conjugation?.toJson(),
      'comparative': comparative,
      'superlative': superlative,
      'related_words': relatedWords,
      'difficulty_level': difficultyLevel,
      'created_by': createdBy,
      'back': back,
    };
  }
}

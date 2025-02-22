import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:isar/isar.dart';
import 'package:wortmeister/data/models/conjugation.dart';
import 'package:wortmeister/data/models/meaning.dart';

part 'word.g.dart';

@Collection()
class Word {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String wordId;

  late String word;

  late String language;

  String? pronunciation;

  String? plural;

  String? gender;

  String? article;

  List<Meaning>? meanings;

  Conjugation? conjugation;

  String? comparative;

  String? superlative;

  List<String>? relatedWords;

  String? difficultyLevel;

  late String createdBy;

  String? back;

  late DateTime lastUpdated;

  late bool isDeleted;

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
    required this.lastUpdated,
    this.isDeleted = false,
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
      lastUpdated: json['last_updated'] is firestore.Timestamp
          ? (json['last_updated'] as firestore.Timestamp).toDate()
          : DateTime.now(),
      isDeleted: json['is_deleted'] ?? false,
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
      'last_updated': lastUpdated,
      'is_deleted': isDeleted,
    };
  }
}

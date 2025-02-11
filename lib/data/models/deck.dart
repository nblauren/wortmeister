class Deck {
  final String deckId;
  final String title;
  final String description;
  final List<String> wordIds; // List of Word IDs or references

  Deck({
    required this.deckId,
    required this.title,
    required this.description,
    required this.wordIds,
  });

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      deckId: json['deck_id'],
      title: json['title'],
      description: json['description'],
      wordIds: List<String>.from(json['word_ids']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deck_id': deckId,
      'title': title,
      'description': description,
      'word_ids': wordIds,
    };
  }
}

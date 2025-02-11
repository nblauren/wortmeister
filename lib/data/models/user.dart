class User {
  final String userId;
  final String username;
  final String email;
  final List<String> deckIds; // List of Deck IDs

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.deckIds,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['username'],
      email: json['email'],
      deckIds: List<String>.from(json['deck_ids']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'email': email,
      'deck_ids': deckIds,
    };
  }
}

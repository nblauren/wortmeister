import 'package:wortmeister/core/services/firebase_auth_service.dart';
import 'package:wortmeister/core/services/firebase_firestore_service.dart';
import 'package:wortmeister/data/models/user.dart';

class UserController {
  final FirebaseFirestoreService firebaseService;
  final FirebaseAuthService firebaseAuthService;

  UserController({
    required this.firebaseService,
    required this.firebaseAuthService,
  });

  // Create a user in Firebase Firestore
  Future<void> createUser(User user) async {
    try {
      await firebaseService.setDocument(
        'users/${user.userId}',
        user.toJson(),
      );
    } catch (e) {
      throw Exception('Error creating user: $e');
    }
  }

  // Get the current user from Firebase Auth
  User? getCurrentUser() {
    final firebaseUser = firebaseAuthService.currentUser();
    if (firebaseUser != null) {
      return User(
          userId: firebaseUser.uid,
          username: firebaseUser.displayName ?? '',
          email: firebaseUser.email ?? '',
          deckIds: []);
    } else {
      return null;
    }
  }

  // Get user data from Firestore by userId
  Future<User> getUser(String userId) async {
    try {
      var docSnapshot = await firebaseService.getDocumentSnapshot(
        'users/$userId',
      );
      if (docSnapshot.exists) {
        return User.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Error retrieving user: $e');
    }
  }

  // Update user data
  Future<void> updateUser(User user) async {
    try {
      await firebaseService.updateDocument(
        'users/${user.userId}',
        user.toJson(),
      );
    } catch (e) {
      throw Exception('Error updating user: $e');
    }
  }

  // Delete user data
  Future<void> deleteUser(String userId) async {
    try {
      await firebaseService.deleteDocument('users/$userId');
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }

  // Get all users
  Future<List<User>> getAllUsers() async {
    try {
      var querySnapshot = await firebaseService.getCollectionSnapshot('users');
      return querySnapshot.docs
          .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Error retrieving all users: $e');
    }
  }
}

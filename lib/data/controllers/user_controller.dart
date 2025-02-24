import 'package:wortmeister/core/services/firebase_firestore_service.dart';
import 'package:wortmeister/data/models/user.dart';

class UserController {
  final FirebaseFirestoreService firebaseFirestoreService;

  UserController({required this.firebaseFirestoreService});

  Future<User?> getUserById(String userId) async {
    try {
      final userData =
          await firebaseFirestoreService.getDocument('/users/$userId').get();
      if (userData.exists) {
        return User.fromJson(userData.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error getting user by ID: $e');
    }
    return null;
  }
}

import 'package:wortmeister/core/services/isar_service.dart';
import 'package:wortmeister/data/models/user.dart';

class UserController {
  final IsarService isarService;

  UserController({required this.isarService});

  // Create a new user
  Future<void> createUser(User user) async {
    try {
      await isarService.addItem(user);
    } catch (e) {
      throw Exception('Error creating user: $e');
    }
  }

  // Get a user by its ID
  Future<User> getUser(String userId) async {
    try {
      final users = await isarService.getItems<User>();
      final user = users.firstWhere((user) => user.userId == userId,
          orElse: () => throw Exception('User not found'));
      return user;
    } catch (e) {
      throw Exception('Error retrieving user: $e');
    }
  }

  // Update a user
  Future<void> updateUser(User user) async {
    try {
      await isarService.addItem(user);
    } catch (e) {
      throw Exception('Error updating user: $e');
    }
  }

  // Delete a user
  Future<void> deleteUser(int userId) async {
    try {
      await isarService.deleteItem<User>(userId);
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/controllers/user_controller.dart';
import 'package:wortmeister/data/models/user.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController(
        firebaseFirestoreService: LocatorService.firebaseFirestoreService);
    return FutureBuilder<User?>(
      future: userController
          .getUserById(LocatorService.firebaseAuthService.currentUser()!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final user = snapshot.data;
          if (user == null) {
            return Text('Unknown');
          } else {
            return Text(
              user.name,
            );
          }
        } else {
          return Text('No data');
        }
      },
    );
  }
}

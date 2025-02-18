import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/firebase_auth_service.dart';
import 'package:wortmeister/screens/home/home_screen.dart';
import 'package:wortmeister/screens/login/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<FirebaseAuthService>(
      context,
      listen: false,
    );
    return FlutterSplashScreen.gif(
      gifPath: 'assets/images/splash.gif',
      gifWidth: 500,
      gifHeight: 500,
      backgroundColor: Color(0xFFF4C7FF),
      nextScreen: StreamBuilder<User?>(
        stream: authService.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else if (snapshot.hasData) {
            return Provider(
              create: (context) => authService,
              child: HomeScreen(),
            );
          } else {
            return LoginScreen();
          }
        },
      ),
      duration: const Duration(milliseconds: 3515),
      onInit: () async {
        debugPrint("onInit");
      },
      onEnd: () async {
        debugPrint("onEnd 1");
      },
    );
  }
}

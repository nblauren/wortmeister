import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/firebase_auth_service.dart';
import 'package:wortmeister/firebase_options.dart';
import 'package:wortmeister/screens/login/login_screen.dart';
import 'package:wortmeister/screens/practice/practice_screen.dart';
import 'package:wortmeister/screens/signup/signup_screen.dart';
import 'package:wortmeister/widgets/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(create: (_) => FirebaseAuthService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wort Meister',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthWrapper(),
        '/login': (context) => LoginScreen(),
        '/practice': (context) => PracticeScreen(),
        '/settings': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}

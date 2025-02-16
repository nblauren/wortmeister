import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/firebase_auth_service.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/firebase_options.dart';
import 'package:wortmeister/screens/add_deck/add_deck_screen.dart';
import 'package:wortmeister/screens/add_word/add_word_screen.dart';
import 'package:wortmeister/screens/deck/deck_screen.dart';
import 'package:wortmeister/screens/login/login_screen.dart';
import 'package:wortmeister/screens/practice/practice_screen.dart';
import 'package:wortmeister/screens/settings/settings_screen.dart';
import 'package:wortmeister/screens/signup/signup_screen.dart';
import 'package:wortmeister/widgets/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocatorService.configureLocalModuleInjection();
  runApp(
    MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
            create: (_) => LocatorService.firebaseAuthService),
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => AuthWrapper());
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/settings':
            return MaterialPageRoute(builder: (context) => SettingsScreen());
          case '/new-deck':
            return MaterialPageRoute(builder: (context) => AddDeckScreen());
          case '/signup':
            return MaterialPageRoute(builder: (context) => SignupScreen());
          case '/new-word':
            return MaterialPageRoute(builder: (context) {
              final deck = settings.arguments as Deck;
              return MultiProvider(
                providers: [
                  Provider<Deck>(
                    create: (_) => deck,
                  ),
                ],
                child: AddWordScreen(),
              );
            });
          case '/practice':
            return MaterialPageRoute(builder: (context) {
              final deck = settings.arguments as Deck;
              return MultiProvider(
                providers: [
                  Provider<Deck>(
                    create: (_) => deck,
                  ),
                ],
                child: PracticeScreen(),
              );
            });
          case '/deck':
            return MaterialPageRoute(builder: (context) {
              final deck = settings.arguments as Deck;
              return MultiProvider(
                providers: [
                  Provider<Deck>(
                    create: (_) => deck,
                  ),
                ],
                child: DeckScreen(),
              );
            });
          default:
            return null;
        }
      },
    );
  }
}

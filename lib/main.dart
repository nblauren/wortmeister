import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/firebase_options.dart';
import 'package:wortmeister/screens/add_word/add_word_screen.dart';
import 'package:wortmeister/screens/deck/deck_screen.dart';
import 'package:wortmeister/screens/login/login_screen.dart';
import 'package:wortmeister/screens/practice/practice_screen.dart';
import 'package:wortmeister/screens/settings/settings_screen.dart';
import 'package:wortmeister/screens/signup/signup_screen.dart';
import 'package:wortmeister/screens/sync/sync_screen.dart';
import 'package:wortmeister/widgets/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocatorService.configureLocalModuleInjection();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://c835690e841e08b0bcdd5567e4b63202@o1346306.ingest.us.sentry.io/4508849863786496';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
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
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFEFC3F9)),
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        onGenerateRoute: (settings) {
          final uri = Uri.parse(settings.name ?? '');

          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'deck') {
            final deckId = uri.pathSegments[1];
            return MaterialPageRoute(
              builder: (context) => DeckScreen(deckId: deckId),
            );
          } else {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (context) => AuthWrapper());
              case '/login':
                return MaterialPageRoute(builder: (context) => LoginScreen());
              case '/settings':
                return MaterialPageRoute(
                    builder: (context) => SettingsScreen());
              case '/signup':
                return MaterialPageRoute(builder: (context) => SignupScreen());
              case '/practice':
                final deck = settings.arguments as Deck;
                return MaterialPageRoute(
                  builder: (context) => Provider(
                    create: (_) => deck,
                    child: PracticeScreen(),
                  ),
                );
              case '/new-word':
                final deck = settings.arguments as Deck;
                return MaterialPageRoute(
                  builder: (context) => Provider(
                    create: (_) => deck,
                    child: AddWordScreen(),
                  ),
                );
              case '/sync':
                return MaterialPageRoute(builder: (context) {
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (_) => SyncNotifier()),
                    ],
                    child: SyncScreen(),
                  );
                });
              default:
                return null;
            }
          }
        });
  }
}

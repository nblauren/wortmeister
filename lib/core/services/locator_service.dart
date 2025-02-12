import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:wortmeister/core/services/firebase_auth_service.dart';
import 'package:wortmeister/core/services/firebase_firestore_service.dart';
import 'package:wortmeister/core/services/firebase_remote_config_service.dart';
import 'package:wortmeister/core/services/tts_service.dart';

/// A service locator class to manage and retrieve various services.
class LocatorService {
  static final GetIt getIt = GetIt.instance;

  /// Registers all the singleton services.
  static Future<void> configureLocalModuleInjection() async {
    // Register FirebaseRemoveConfig as a singleton
    getIt.registerSingleton<FirebaseRemoteConfigService>(
      FirebaseRemoteConfigService(FirebaseRemoteConfig.instance),
    );

    // Register FirestoreService as a singleton
    getIt.registerSingleton<FirebaseFirestoreService>(
      FirebaseFirestoreService(FirebaseFirestore.instance),
    );
    // Register FirestoreService as a singleton
    getIt.registerSingleton<FirebaseAuthService>(
      FirebaseAuthService(FirebaseAuth.instance),
    );

    // Register Tts Service as a singleton
    getIt.registerSingleton<TTSService>(
      TTSService(),
    );
  }

  /// Getter for FirestoreService instance.
  static FirebaseFirestoreService get firebaseFirestoreService =>
      getIt<FirebaseFirestoreService>();

  /// Getter for FirebaseAuthService instance.
  static FirebaseAuthService get firebaseAuthService =>
      getIt<FirebaseAuthService>();

  /// Getter for FirebaseRemoveConfig instance.
  static FirebaseRemoteConfigService get firebaseRemoteConfig =>
      getIt<FirebaseRemoteConfigService>();

  /// Getter for Tts Service instance.
  static TTSService get tTSService => getIt<TTSService>();
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Check if user is logged in
  User? currentUser() {
    User? user = _firebaseAuth.currentUser;
    return user;
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      // Handle sign-in errors
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      // Handle sign-out errors
      rethrow;
    }
  }

  // Register with email and password
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      // Handle registration errors
      rethrow;
    }
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Handle password reset errors
      rethrow;
    }
  }

  // Update user profile
  Future<void> updateProfile({String? displayName, String? photoURL}) async {
    try {
      await _firebaseAuth.currentUser?.updateProfile(
        displayName: displayName,
        photoURL: photoURL,
      );
      await _firebaseAuth.currentUser?.reload();
    } catch (e) {
      // Handle profile update errors
      rethrow;
    }
  }

  // Verify email
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      // Handle email verification errors
      rethrow;
    }
  }

  // Delete user
  Future<void> deleteUser() async {
    try {
      await _firebaseAuth.currentUser?.delete();
    } catch (e) {
      // Handle user deletion errors
      rethrow;
    }
  }

  // Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      // Handle sign-in errors
      rethrow;
    }
  }

  // Sign in with Apple
  Future<UserCredential> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      return await _firebaseAuth.signInWithProvider(appleProvider);
    } catch (e) {
      // Handle sign-in errors
      rethrow;
    }
  }
}

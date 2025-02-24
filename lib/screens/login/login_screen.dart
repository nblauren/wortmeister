import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';

class LoginNotifier extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(
    context, {
    required String email,
    required String password,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await LocatorService.firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          _errorMessage = 'The supplied credential is invalid.';
          break;
        case 'invalid-email':
          _errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          _errorMessage =
              'The user corresponding to the given email has been disabled.';
          break;
        case 'user-not-found':
          _errorMessage = 'There is no user corresponding to the given email.';
          break;
        case 'wrong-password':
          _errorMessage = 'The password is invalid for the given email.';
          break;
        default:
          _errorMessage = 'An undefined Error happened.';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginNotifier(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          color: Color(0xFFF4C7FF),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: AutofillGroup(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 150.0,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Consumer<LoginNotifier>(
                        builder: (_, loginNotifier, __) {
                          return ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                await loginNotifier.login(
                                  context,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                            child: loginNotifier._isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text('Login'),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not a member? '),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text('Signup now'),
                        ),
                      ],
                    ),
                    Selector<LoginNotifier, String?>(
                      selector: (_, notifier) => notifier.errorMessage,
                      builder: (_, errorMessage, __) {
                        if (errorMessage == null) return SizedBox.shrink();
                        return Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

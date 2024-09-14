// lib/login_screen.dart
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart'; // Import the logger package
import 'profile_creation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key}); // Converted 'key' to a super parameter

  @override
  LoginScreenState createState() => LoginScreenState(); // Make the state class public
}

class LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Made final
  final Logger _logger = Logger(); // Initialize the logger

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        if (mounted) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileCreationScreen(user: googleUser)));
        }
      }
    } catch (error) {
      _logger.e("Sign in failed: $error"); // Use logger instead of print
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleSignIn,
          child: const Text("Login with Google"),
        ),
      ),
    );
  }
}
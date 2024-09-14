// lib/splash_screen.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key}); // Added key parameter

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png'), // Ensure you have a logo in your assets
      ),
    );
  }
}
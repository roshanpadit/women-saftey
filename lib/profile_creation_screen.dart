// lib/profile_creation_screen.dart
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileCreationScreen extends StatefulWidget {
  final GoogleSignInAccount user;

  const ProfileCreationScreen({super.key, required this.user}); // Converted 'key' to a super parameter

  @override
  ProfileCreationScreenState createState() => ProfileCreationScreenState(); // Make the state class public
}

class ProfileCreationScreenState extends State<ProfileCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? gender;
  String? dob;
  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Profile")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                onSaved: (value) => name = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (value) => value!.isEmpty ? 'Enter your gender' : null,
                onSaved: (value) => gender = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                validator: (value) => value!.isEmpty ? 'Enter your date of birth' : null,
                onSaved: (value) => dob = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) => value!.isEmpty ? 'Enter your phone number' : null,
                onSaved: (value) => phone = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                  }
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
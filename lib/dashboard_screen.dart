// lib/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'notifications_screen.dart';
import 'emergency_contacts_screen.dart';
import 'sos_feature.dart'; // Ensure SosFeature is defined correctly

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key}); // Converted 'key' to a super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()))),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()))),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SosFeature()));
          },
          child: const Text("SOS"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const EmergencyContactsScreen()));
        },
        child: const Icon(Icons.contact_phone),
      ),
    );
  }
}
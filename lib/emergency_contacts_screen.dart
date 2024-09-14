// lib/emergency_contacts_screen.dart
import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key}); // Converted 'key' to a super parameter

  @override
  EmergencyContactsScreenState createState() => EmergencyContactsScreenState(); // Make the state class public
}

class EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  List<String> contacts = [];

  void _addContact(String contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Emergency Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(contacts[index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String contactName = '';
              return AlertDialog(
                title: const Text('Add Contact'),
                content: TextField(
                  onChanged: (value) {
                    contactName = value;
                  },
                  decoration: const InputDecoration(hintText: "Contact Name"),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (contactName.isNotEmpty) {
                        _addContact(contactName);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
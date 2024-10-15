import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  double _textSize = 18.0;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Dark Mode Toggle
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                    // Add logic to toggle the theme if needed
                  });
                },
              ),
            ),
            Divider(),

            // Text Size Slider
            ListTile(
              title: Text('Text Size'),
              subtitle: Slider(
                value: _textSize,
                min: 12.0,
                max: 24.0,
                divisions: 6,
                label: '${_textSize.round()}',
                onChanged: (value) {
                  setState(() {
                    _textSize = value;
                    // Add logic to apply text size change if needed
                  });
                },
              ),
            ),
            Divider(),

            // Language Dropdown
            ListTile(
              title: Text('Language'),
              subtitle: DropdownButton<String>(
                value: _language,
                items: <String>['English', 'Tamil', 'Spanish', 'French']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _language = newValue!;
                    // Add logic to apply language change if needed
                  });
                },
              ),
            ),
            Divider(),

            // Sign-Out Button
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

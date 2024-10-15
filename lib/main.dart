import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart'; // Ensure this import is included
import 'home_page.dart'; // Import your home page
import 'login_page.dart'; // Import your login page
import 'signup_page.dart'; // Import your signup page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase and handle potential errors
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print('Firebase initialization error: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/login', // Set the initial route to the login page
      routes: {
        '/login': (context) => LoginPage(), // Route for Login Page
        '/signup': (context) => SignupPage(), // Route for Signup Page
        '/home': (context) => HomePage(
              onThemeChanged: () {},
              isDarkMode: false,
            ), // Route for Home Page
      },
      home: MAASWardrobeApp(),
    );
  }
}

class MAASWardrobeApp extends StatefulWidget {
  @override
  _MAASWardrobeAppState createState() => _MAASWardrobeAppState();
}

class _MAASWardrobeAppState extends State<MAASWardrobeApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MASS Wardrobe'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return HomePage(
              isDarkMode: _isDarkMode,
              onThemeChanged: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ); // User is logged in
          } else {
            return LoginPage(); // User is not logged in
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action for the floating button
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDarkMode ? Colors.teal : Colors.pinkAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

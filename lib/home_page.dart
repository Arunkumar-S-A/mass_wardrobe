// home_page.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MapPage.dart'; // Page for map
import 'wardrobe_list_page.dart'; // Page for wardrobe items
import 'gallery_page.dart'; // Page for gallery images
import 'settings_page.dart'; // Page for settings

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  HomePage({required this.isDarkMode, required this.onThemeChanged});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages that can be navigated to from the bottom navigation bar
  final List<Widget> _pages = [
    WardrobeListPage(), // Wardrobe list page
    GalleryPage(), // Gallery page
    SettingsPage(), // Settings page
  ];

  // Method to update the selected tab when an item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MAAS Wardrobe'),
        toolbarHeight: isWideScreen
            ? 100
            : 56, // Adjust app bar height based on screen width
      ),
      body: _pages[_selectedIndex], // Display the selected page

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min, // Ensure FABs don't take extra space
        children: [
          // First FAB for the map icon
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MapPage()), // Navigate to the map page
              );
            },
            heroTag: 'mapIcon', // Ensure unique heroTag for each FAB
            child: const Icon(CupertinoIcons.map_pin_ellipse), // Map icon
            mini: true, // Smaller FAB
            tooltip: 'Map View',
          ),
          const SizedBox(height: 10), // Space between the two FABs
          // Second FAB for theme toggle
          FloatingActionButton(
            onPressed: () {
              widget.onThemeChanged(); // Toggle the theme

              // Display a SnackBar to notify the user of the theme change
              final themeMessage = widget.isDarkMode
                  ? 'Switched to Light Mode'
                  : 'Switched to Dark Mode';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(themeMessage),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            heroTag: 'themeIcon', // Unique heroTag for this FAB
            child: Icon(widget.isDarkMode
                ? Icons.dark_mode
                : Icons.light_mode), // Change icon based on theme
            tooltip: 'Toggle Theme',
          ),
        ],
      ),

      // Bottom navigation bar to switch between pages
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Wardrobe tab icon
            label: 'Wardrobe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album), // Gallery tab icon
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Settings tab icon
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // Highlight the selected tab
        selectedItemColor: Colors.blue, // Color for the selected tab
        unselectedItemColor: Colors.grey, // Color for unselected tabs
        onTap: _onItemTapped, // Handle tab change on tap
      ),
    );
  }
}

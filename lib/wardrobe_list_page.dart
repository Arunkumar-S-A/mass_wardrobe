import 'package:flutter/material.dart';

class WardrobeListPage extends StatelessWidget {
  final List<Map<String, String>> _items = [
    {'image': 'assets/shirts.png', 'caption': 'Shirt'},
    {'image': 'assets/pant.png', 'caption': 'Pants'},
    {'image': 'assets/jacket.jpeg', 'caption': 'Jacket'},
    {'image': 'assets/shoe.png', 'caption': 'Shoes'},
    {'image': 'assets/hat.jpg', 'caption': 'Hat'},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 600;
    final int crossAxisCount = isWideScreen ? 3 : 2;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Custom height for the AppBar
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30), // Rounded corners for the AppBar
            ),
          ),
          title: Text(
            'Wardrobe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true, // Center the title
          backgroundColor: Colors.teal, // Custom color for the AppBar
          elevation: 5, // Elevation to create a shadow effect
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the grid
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1, // Adjusted aspect ratio for better alignment
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle the onTap event here
                print('Tapped on ${_items[index]['caption']}');
                // You can navigate to another page or show a dialog here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecommendationPage(
                      itemCaption: _items[index]['caption']!,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color for each item
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          15), // Rounded corners for the image
                      child: Image.asset(
                        _items[index]['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10), // Spacing between image and text
                    Text(
                      _items[index]['caption']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecommendationPage extends StatelessWidget {
  final String itemCaption;

  RecommendationPage({required this.itemCaption});

  final Map<String, List<Map<String, String>>> _recommendations = {
    'Shirt': [
      {'image': 'assets/shirt/AA1.jpeg', 'caption': 'Maroon Shirt'},
      {'image': 'assets/shirt/AA2.jpeg', 'caption': 'Blue Shirt'},
      {'image': 'assets/shirt/AA3.jpeg', 'caption': 'Green Shirt'},
      {'image': 'assets/shirt/AA4.jpeg', 'caption': 'Brown Shirt'},
      {'image': 'assets/shirt/AA5.jpeg', 'caption': 'Ginger Shirt'},
    ],
    'Pants': [
      {'image': 'assets/Items/item1.jpg', 'caption': 'Jeans'},
      {'image': 'assets/Items/item3.jpg', 'caption': 'Khakis'},
    ],
    // Add more recommendations as needed
  };

  @override
  Widget build(BuildContext context) {
    final recommendations = _recommendations[itemCaption] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$itemCaption Recommendations'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // Rounded corners for the AppBar
          ),
        ),
        backgroundColor: Colors.deepPurple, // Custom color for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the grid
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: recommendations.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color for each item
                borderRadius: BorderRadius.circular(15), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        15), // Rounded corners for the image

                    child: Image.asset(
                      recommendations[index]['image']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10), // Spacing between image and text
                  Text(
                    recommendations[index]['caption']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

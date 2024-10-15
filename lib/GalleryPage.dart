import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<Map<String, String>> _items = [
    {'image': 'assets/Items/item1.jpg', 'caption': 'Item 1'},
    {'image': 'assets/Items/item2.jpg', 'caption': 'Item 2'},
    {'image': 'assets/Items/item3.jpg', 'caption': 'Item 3'},
    {'image': 'assets/Items/item4.jpg', 'caption': 'Item 4'},
    // {'image': 'assets/Items/item5.jpg', 'caption': 'Item 5'},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Adjust the height of the AppBar
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Rounded corners at the bottom
          ),
          child: AppBar(
            title: Text('Gallery'),
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWideScreen ? 4 : 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigate to detail page or perform some action
                print('Tapped on ${_items[index]['caption']}');
              },
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Rounded corners for images
                  child: Image.asset(
                    _items[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(_items[index]['caption']!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


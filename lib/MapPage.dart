import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Location {
  final String name;
  final double latitude;
  final double longitude;

  Location(this.name, this.latitude, this.longitude);
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng _currentCenter = LatLng(9.9252, 78.1198); // Default to Madurai, India
  double _currentZoom = 13.0;

  // List of locations
  final List<Location> locations = [
    Location('Ambasamudram, India', 8.7042, 77.4510), // Athithyan-Home
    Location('Tirunelveli, India', 8.7139, 77.7567),
    Location('Madurai, India', 9.9252, 78.1198),
    Location('New York, USA', 40.7128, -74.0060),
    Location('Thiagarajar College, Tirupparakundram', 9.9129, 78.1477),
  ];

  void _updateMap(Location location) {
    setState(() {
      _currentCenter = LatLng(location.latitude, location.longitude);
      _currentZoom = 13.0; // Reset zoom if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(locations[index].name),
                  onTap: () {
                    _updateMap(locations[index]);
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: FlutterMap(
              key: ValueKey(_currentCenter), // Unique key to rebuild the map
              options: MapOptions(
                center: _currentCenter,
                zoom: _currentZoom,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: locations.map((location) {
                    return Marker(
                      point: LatLng(location.latitude, location.longitude),
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

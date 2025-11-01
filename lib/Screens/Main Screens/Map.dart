import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';

class CampusMapScreen extends StatefulWidget {
  const CampusMapScreen({super.key});

  @override
  State<CampusMapScreen> createState() => _CampusMapScreenState();
}

class _CampusMapScreenState extends State<CampusMapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredPlaces = [];

  // Example campus places
  final List<Map<String, dynamic>> campusPlaces = [
    {
      "name": "Main Library",
      "desc": "The central library with Wi-Fi and study areas.",
      "lat": 9.4095,
      "lng": 42.0407,
      "color": const Color(0xFF2563EB),
    },
    {
      "name": "Cafeteria",
      "desc": "Affordable meals and snacks available all day.",
      "lat": 9.4088,
      "lng": 42.0412,
      "color": const Color(0xFFEA580C),
    },
    {
      "name": "ICT Lab",
      "desc": "Computer lab for programming and research.",
      "lat": 9.4101,
      "lng": 42.037225,
      "color": const Color(0xFF9333EA),
    },
    {
      "name": "Afran kalo hall",
      "desc": "Gathering spot for events, clubs, and announcements.",
      "lat": 9.420437,
      "lng": 42.037225,
      "color": const Color(0xFF16A34A),
    },
  ];

  @override
  void initState() {
    super.initState();
    _filteredPlaces = campusPlaces;
    _searchController.addListener(_filterPlaces);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterPlaces);
    _searchController.dispose();
    super.dispose();
  }

  void _filterPlaces() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPlaces = campusPlaces.where((place) {
        return place['name'].toLowerCase().contains(query) ||
            place['desc'].toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Campus Map",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Find important places around the university",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Map View
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(9.4094, 42.0405),
                  initialZoom: 16.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWlmdGFoLWRldiIsImEiOiJjbWgzcncwNXAwMzA3MmtxbnpiNTNraTh6In0.b38pKFNBDPM58ktI8SXOkA',
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoibWlmdGFoLWRldiIsImEiOiJjbWgzcncwNXAwMzA3MmtxbnpiNTNraTh6In0.b38pKFNBDPM58ktI8SXOkA',
                    },
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: campusPlaces.map((place) {
                      return Marker(
                        width: 80,
                        height: 80,
                        point: LatLng(place["lat"], place["lng"]),
                        child: GestureDetector(
                          onTap: () => _showPlaceDetails(place),
                          child: Icon(
                            Icons.location_pin,
                            color: place["color"],
                            size: 36,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          // Place List Section
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for a place...',
                      prefixIcon: const Icon(CupertinoIcons.search, size: 20),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Campus Places",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: _filteredPlaces.length,
                      itemBuilder: (context, index) {
                        final place = _filteredPlaces[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _PlaceCard(
                            title: place["name"],
                            description: place["desc"],
                            color: place["color"],
                            onTap: () {
                              _mapController.move(
                                LatLng(place["lat"], place["lng"]),
                                17.0,
                              );
                              _showPlaceDetails(place);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPlaceDetails(Map<String, dynamic> place) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place["name"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(place["desc"], style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.location_pin, color: place["color"]),
                const SizedBox(width: 6),
                Text(
                  "Lat: ${place["lat"]}, Lng: ${place["lng"]}",
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _PlaceCard({
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.place, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

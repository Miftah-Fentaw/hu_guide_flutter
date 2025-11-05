import 'package:flutter/material.dart';
import 'package:hu_guide/Screens/Main%20Screens/Map.dart';
import 'package:hu_guide/models/campus_models.dart';
import 'package:hu_guide/models/map_model.dart';


class LocationCard extends StatelessWidget {
  final Location location;
   final Map<String, dynamic>? focusPlace;
  const LocationCard({super.key, required this.location, this.focusPlace});

  Color getStatusColor(String? status, BuildContext context) {
    if (status == "open") return Colors.green;
    if (status == "closed") return Colors.redAccent;
    return Colors.grey;
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(location.icon, color: Colors.lightBlue, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        location.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (location.status != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor(
                            location.status,
                            context,
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          location.status!.toUpperCase(),
                          style: TextStyle(
                            color: getStatusColor(location.status, context),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  location.type,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        location.location,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                if (location.hours != null) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        location.hours!,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
                if (location.phone != null) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        location.phone!,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 10),
               TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CampusMapScreen(location: location),
      ),
    );
  },
  style: TextButton.styleFrom(
    backgroundColor: Colors.orange.withOpacity(0.1),
    foregroundColor: Colors.orangeAccent,
    padding: const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 6,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: const Text(
    "View on map",
    style: TextStyle(fontWeight: FontWeight.w600),
  ),
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CampusScreen extends StatefulWidget {
  const CampusScreen({super.key});

  @override
  State<CampusScreen> createState() => _CampusScreenState();
}

class _CampusScreenState extends State<CampusScreen> {
  int selectedIndex = 0;
  final List<String> categories = ["Buildings", "Dorms", "Cafés", "Offices"];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Campus Directory",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Find buildings, offices, cafés, and more",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    if (selectedIndex == 0)
                      ...buildings.map((b) => LocationCard(location: b)),
                    if (selectedIndex == 1)
                      ...dorms.map((b) => LocationCard(location: b)),
                    if (selectedIndex == 2)
                      ...Cafes.map((b) => LocationCard(location: b)),
                    if (selectedIndex == 3)
                      ...offices.map((b) => LocationCard(location: b)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hu_guide/Screens/%20Colleges%20Screens/College_Screen.dart';
import 'package:hu_guide/Screens/Clubs Screens/Club_Screen.dart';
import 'package:hu_guide/Screens/Main%20Screens/Map.dart';
import 'package:hu_guide/Screens/events%20Screens/Events_screen.dart';
import 'package:hu_guide/Screens/srvices%20screens/cafteria.dart';
import 'package:hu_guide/Screens/srvices%20screens/services_screen.dart';
import 'package:hu_guide/models/services_model.dart';
import 'package:hu_guide/Screens/srvices%20screens/service_detail_screen.dart';
import 'package:hu_guide/widgets/event_dard.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:hu_guide/models/events_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuickAccessItem {
  final String title;
  final IconData icon;
  final Widget screen;
  final List<Color> gradient;

  const QuickAccessItem({
    required this.title,
    required this.icon,
    required this.screen,
    required this.gradient,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Event>> fetchEvents() async {
    final response = await http.get(
      Uri.parse('http://192.168.137.122:8000/api/events/'),
    );

    // Android emulator: 10.0.2.2 points to localhost
    if (response.statusCode == 200) {
      // Decode JSON as a list, not a map
      final List<dynamic> eventsJson = json.decode(response.body);
      return eventsJson.map((e) => Event.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  final TextEditingController controller = TextEditingController();

  // Data moved outside the build method
  final List<QuickAccessItem> _quickAccessItems = [];

  void _onSearchChanged(String value) {}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    // Quick Access Items
    _quickAccessItems.addAll([
      QuickAccessItem(
        title: "Colleges",
        icon: Icons.school,
        screen: Colleges(),
        gradient: [Colors.blue, Colors.indigo],
      ),
      QuickAccessItem(
        title: "Clubs",
        icon: CupertinoIcons.group,
        screen: Clubs(),
        gradient: [Colors.pink, Colors.orange],
      ),
      QuickAccessItem(
        title: "Cafeteria",
        icon: Icons.food_bank_outlined,
        screen: CafeteriaScreen(),
        gradient: [Colors.teal, Colors.green],
      ),
      QuickAccessItem(
        title: "Explore Locations",
        icon: CupertinoIcons.location_north,
        screen: CampusMapScreen(),
        gradient: [Colors.purple, Colors.deepPurpleAccent],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'HU GUIDE!',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Explore Haramaya University',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: controller,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    label: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: Colors.black54,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Quick Access',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _quickAccessItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth > 600 ? 3 : 2,
                    crossAxisSpacing: screenWidth * 0.025,
                    mainAxisSpacing: screenWidth * 0.025,
                    childAspectRatio: 1 / 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final item = _quickAccessItems[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => item.screen),
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.white24,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: item.gradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: item.gradient.last.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.11,
                              height: screenWidth * 0.11,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                item.icon,
                                color: Colors.white,
                                size: screenWidth * 0.06,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's Events",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Events()),
                        );
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),
                FutureBuilder<List<Event>>(
                  future: fetchEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting, show your custom loading indicator
                      return Center(
                        child: SizedBox(
                          height: 50,

                          child: LoadingIndicator(
                            colors: [
                              Colors.black,
                              Colors.red,
                              Colors.green,
                              Colors.blue,
                              Colors.yellow,
                              Colors.orange,
                              Colors.purple,
                              Colors.pink,
                            ],
                            indicatorType: Indicator.lineSpinFadeLoader,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      // Display errors from the backend or parsing issues
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // Handle empty event list
                      return const Center(child: Text('No events found.'));
                    }
                    final eventsList = snapshot.data!;
                    return SafeArea(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          setState(() {});
                        },
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: eventsList
                                .map((event) => EventCard(event: event))
                                .toList(
                                  growable: true
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                
                 
                ),
                SizedBox(height: screenHeight * 0.03125),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Services",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.01),

                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.0125),
                  child: Column(
                    // Use ListView.builder for dynamic lists
                    children: List.generate(4, (index) {
                      final item = services[index];

                      return Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.01875),
                        padding: EdgeInsets.all(screenWidth * 0.05),
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
                          border: Border.all(strokeAlign: 10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.11,
                              height: screenWidth * 0.11,
                              decoration: BoxDecoration(
                                color: item.color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                item.icon,
                                color: Colors.white,
                                size: screenWidth * 0.06,
                              ),
                            ),

                            SizedBox(width: screenWidth * 0.025),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    item.description,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.0325,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ServiceDetailScreen(service: item),
                                  ),
                                );
                              },
                              child: Icon(
                                CupertinoIcons.arrow_right_circle_fill,
                                color: Colors.blueAccent,
                                size: screenWidth * 0.07,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

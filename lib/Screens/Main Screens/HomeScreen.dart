import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hu_guide/Screens/%20Colleges%20Screens/College_Screen.dart';
import 'package:hu_guide/Screens/Clubs%20Screens/Club_Screen.dart';
import 'package:hu_guide/Screens/Main%20Screens/Map.dart';
import 'package:hu_guide/Screens/events%20Screens/Events_screen.dart';
import 'package:hu_guide/Screens/srvices%20screens/cafteria.dart';
import 'package:hu_guide/Screens/srvices%20screens/services_screen.dart';
import 'package:hu_guide/models/services_model.dart';
import 'package:hu_guide/Screens/srvices%20screens/service_detail_screen.dart';
import 'package:hu_guide/widgets/event_card.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:hu_guide/models/events_model.dart';
import 'package:hu_guide/widgets/event_service.dart';
import 'package:hu_guide/Screens/Main Screens/search_screen.dart';

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
  final EventService service = EventService(
    csvUrl:
        'https://docs.google.com/spreadsheets/d/e/2PACX-1vQuN_s5dEI2CQlk0lagEvwfwX0wcmDLL6wbniudoChnTW1jtb9OTJdSsZlLtHABrqQxOHzBIWbBjFfK/pub?output=csv&gid=0',
  );

  late Future<List<Event>> _futureEvents;

  final TextEditingController controller = TextEditingController();

  final List<QuickAccessItem> _quickAccessItems = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _futureEvents = service.fetchEvents();

    controller.addListener(() {
      final query = controller.text.trim();
      if (query.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Search_Results(query: query),
          ),
        );
      }
    });
  }

  Future<void> _refreshEvents() async {
    setState(() {
      _futureEvents = service.fetchEvents();
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  void _loadData() {
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
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: Colors.black54,
                    ),
                    suffixIcon: controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.black54),
                            onPressed: () {
                              controller.clear();
                            },
                          )
                        : null,
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
                      "Latest News and Events",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: _refreshEvents, icon: Icon(Icons.refresh)),
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
                  ],
                ),

                SizedBox(
                  height: screenHeight * 0.18,
                  child: FutureBuilder<List<Event>>(
                    future: _futureEvents,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: LoadingIndicator(
                            indicatorType: Indicator.cubeTransition,
                            colors: [Colors.orange, Colors.blue],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Error: check your internet',
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No events found.'));
                      }

                      final eventsList = snapshot.data!;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: eventsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.03),
                            child: SizedBox(
                              width: screenWidth * 0.7,
                              child: EventCard(
                                event: eventsList[index],
                                imageIndex: index,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
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
                    children: List.generate(5, (index) {
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
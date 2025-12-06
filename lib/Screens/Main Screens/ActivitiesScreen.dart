import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hu_guide/Screens/Clubs%20Screens/Club_Detail_Screen.dart';
import 'package:hu_guide/Screens/Clubs%20Screens/Club_Screen.dart';
import 'package:hu_guide/Screens/events%20Screens/Events_screen.dart';
import 'package:hu_guide/Screens/srvices%20screens/cafteria.dart';
import 'package:hu_guide/credentials.dart';
import 'package:hu_guide/models/clubs_model.dart';
import 'package:hu_guide/widgets/event_service.dart';
import 'package:hu_guide/widgets/event_card.dart';
import 'package:hu_guide/models/events_model.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  late Future<List<Event>> _futureEvents;
  final EventService service = EventService(
    csvUrl: evetntskey,);

  @override
  void initState() {
    super.initState();
    _futureEvents = service.fetchEvents();
  }

  void onNavigate(String route) {
    debugPrint("Navigating to: $route");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.045,
          vertical: screenHeight * 0.025,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Activities",
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              "Explore campus life and services",
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: "Events Today",
                    value: "3",
                    color: Colors.orange,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: _StatCard(
                    title: "Clubs",
                    value: "25+",
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: _StatCard(
                    title: "Menu Items",
                    value: "10+",
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.035),

            _ActivityCard(
              icon: CupertinoIcons.calendar,
              title: "Events & Programs",
              description: "Discover upcoming campus events and activities",
              iconBg: Colors.orange.withOpacity(0.1),
              iconColor: Colors.orange,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Events()),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            _ActivityCard(
              icon: CupertinoIcons.group,
              title: "Clubs & Associations",
              description: "Join student organizations and communities",
              iconBg: Colors.blue.withOpacity(0.1),
              iconColor: Colors.blue,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Clubs()),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            _ActivityCard(
              icon: CupertinoIcons.shopping_cart,
              title: "Cafeteria Menu",
              description: "View today's menu and meal",
              iconBg: Colors.green.withOpacity(0.1),
              iconColor: Colors.green,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CafeteriaScreen()),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),

            Text(
              "Event Updates",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            SizedBox(
              height: screenHeight * 0.18,
              child: FutureBuilder<List<Event>>(
                future: _futureEvents,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingIndicator(
                        colors: [Colors.orange],
                        indicatorType: Indicator.semiCircleSpin,
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
                    return const Center(child: Text('No featured events.'));
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

            SizedBox(height: screenHeight * 0.03),

            Text(
              "Popular Clubs",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            _ClubTile(
              title:
                  "HARAMAY UNIVERSIRT INFORMATICS STUDENTS ASSOCIATION (HUCISA)",
              members: "250 members",
              color: Colors.blue.withOpacity(0.1),
              iconColor: Colors.blue,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClubDetailScreen(club: clubs[0]),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            _ClubTile(
              title: "HARAMAYA UNIVERSITY LAW STUDENTS ASSOCIATION (HULSA)",
              members: "500 members",
              color: Colors.pink.withOpacity(0.1),
              iconColor: Colors.pink,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClubDetailScreen(club: clubs[2]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        child: Column(
          children: [
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.06,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              title,
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.grey[600],
                fontSize: screenWidth * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconBg;
  final Color iconColor;
  final VoidCallback onTap;

  const _ActivityCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.iconBg,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                width: screenWidth * 0.125,
                height: screenWidth * 0.125,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: screenWidth * 0.06),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: screenWidth * 0.0325,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                size: screenWidth * 0.05,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClubTile extends StatelessWidget {
  final String title;
  final String members;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const _ClubTile({
    required this.title,
    required this.members,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Row(
              children: [
                Container(
                  width: screenWidth * 0.11,
                  height: screenWidth * 0.11,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.group,
                    color: iconColor,
                    size: screenWidth * 0.055,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.0025),
                      Text(
                        members,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: screenWidth * 0.045,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

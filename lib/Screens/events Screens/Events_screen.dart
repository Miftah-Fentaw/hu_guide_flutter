import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hu_guide/models/events_model.dart';
import 'package:hu_guide/widgets/event_dard.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Events & Programs',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.grey.shade200,
                        ),
                      ),
                      icon: Icon(CupertinoIcons.xmark, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Discover campus events',
                    style: TextStyle(fontSize: screenWidth * 0.0375),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                FutureBuilder<List<Event>>(
                  future: fetchEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting, show your custom loading indicator
                      return const Center(
                        child: SizedBox(
                          width: 50,
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

                    // Data loaded successfully
                    final eventsList = snapshot.data!;
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() {
                          fetchEvents();
                        });
                      },
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        child: Column(
                          children: eventsList
                              .map((event) => EventCard(event: event))
                              .toList(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hu_guide/credentials.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:hu_guide/models/events_model.dart';
import 'package:hu_guide/widgets/event_screen_card.dart';
import 'package:hu_guide/widgets/event_service.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final EventService service = EventService(
    csvUrl:
        evetntskey,
  );

  late Future<List<Event>> _futureEvents;

  @override
  void initState() {
    super.initState();
    _futureEvents = service.fetchEvents();
  }

  Future<void> _refreshEvents() async {
    setState(() {
      _futureEvents = service.fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News and Events',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(CupertinoIcons.xmark, color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Discover campus events\n* pull to refresh',
                  style: TextStyle(fontSize: screenWidth * 0.0375),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshEvents,
                  child: FutureBuilder<List<Event>>(
                    future: _futureEvents,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: LoadingIndicator(
                              indicatorType: Indicator.lineSpinFadeLoader,
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
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: check your internet',
                                style: const TextStyle(color: Colors.red)));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No events found.'));
                      }

                      final eventsList = snapshot.data!;
                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: eventsList.length,
                        itemBuilder: (context, index) {
                          return EventCard(
                              event: eventsList[index], imageIndex: index);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

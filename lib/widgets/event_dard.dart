import 'package:flutter/material.dart';
import 'package:hu_guide/models/events_model.dart';

class EventCard extends StatefulWidget {
  final Event event;
  const EventCard({super.key, required this.event});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  int index = 0;
    List<String> images = [
    'assets/events/event_one,png',
    'assets/events/event_two,png',
    'assets/events/event_three,png',
    'assets/events/event_four,png',
  ];

   String get imagePath => images[index % images.length];
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath, // Use Image.asset if local
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.event.title.toUpperCase(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(widget.event.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    const Icon(Icons.watch_later_outlined),
                    Text(widget.event.time),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Text(widget.event.location),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

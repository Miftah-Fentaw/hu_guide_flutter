import 'package:flutter/material.dart';
import 'package:hu_guide/models/events_model.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final int imageIndex;

  const EventCard({super.key, required this.event, required this.imageIndex});

  static const List<String> _wordNumbers = [
    'one', 'two', 'three', 'four', 'five',
    'six', 'seven', 'eight', 'nine', 'ten',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final isTablet = width > 600;
    final isLarge = width > 900;

    final double imageHeight = isLarge ? 180 : isTablet ? 150 : 120;
    final double horizontalPadding = width * 0.03;
    final double cardRadius = 16.0;

    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
    ];

    final word = _wordNumbers[imageIndex % _wordNumbers.length];
    final imagePath = 'assets/events/event_$word.png';

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: horizontalPadding,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardRadius)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(cardRadius)),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: imageHeight,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
                Container(
                  height: imageHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        colors[imageIndex % colors.length].withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.Title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isLarge ? 18 : isTablet ? 16 : 15,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: width * 0.01),

                Row(
                  children: [
                    Icon(Icons.access_time,
                        size: isLarge ? 18 : 14, color: Colors.grey[600]),
                    SizedBox(width: width * 0.01),
                    Text(
                      event.Date,
                      style: TextStyle(
                        fontSize: isLarge ? 15 : isTablet ? 14 : 13,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Icon(Icons.place,
                        size: isLarge ? 18 : 14, color: Colors.grey[600]),
                    SizedBox(width: width * 0.01),
                    Expanded(
                      child: Text(
                        event.Place,
                        style: TextStyle(
                          fontSize: isLarge ? 15 : isTablet ? 14 : 13,
                          color: Colors.grey[700],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
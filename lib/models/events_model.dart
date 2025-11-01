import 'package:flutter/material.dart';

class Event {
  final String title;
  final DateTime date;
  final String time;
  final String location;
  final String organizer;
  final String description;
  final List<String> tags;
  final String imagePath;
  final bool isFeatured;

  Event({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.organizer,
    required this.description,
    required this.tags,
    required this.imagePath,
    required this.isFeatured,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      location: json['location'],
      organizer: json['organizer'],
      description: json['description'],
      tags: List<String>.from(json['tags']),
      imagePath: json['imagePath'] ?? '',
      isFeatured: json['isFeatured'],
    );
  }
}

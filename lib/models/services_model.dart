import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String? contact;
  final String? location;
  final String? hours;

  const ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.contact,
    this.location,
    this.hours,
  });
}

final List<ServiceModel> services = [
  ServiceModel(
    title: "Health Center",
    description: "Get medical help, checkups, and emergency care.",
    icon: CupertinoIcons.heart_fill,
    color: Colors.redAccent,
    location: "Near Main Gate, Central Campus",
    hours: "24/7",
    contact: "+251-000-000-000",
  ),
  ServiceModel(
    title: "Library Service",
    description: "Access books, study rooms, and online resources.",
    icon: CupertinoIcons.book_solid,
    color: Colors.blueAccent,
    location: "Main Library, Central Campus",
    hours: "8:00 AM - 10:00 PM",
    contact: "+251-000-000-000",
  ),
  ServiceModel(
    title: "Dormitory Office",
    description: "Get help for dorm assignment, keys, or issues.",
    icon: CupertinoIcons.house_fill,
    color: Colors.orangeAccent,
    location: "Student Service Building, Ground Floor",
    hours: "Mon-Fri: 8:30 AM - 5:00 PM",
    contact: "+251-000-000-000",
  ),
  ServiceModel(
    title: "ICT / Wi-Fi Helpdesk",
    description: "Fix Wi-Fi and university email/login problems.",
    icon: CupertinoIcons.wifi,
    color: Colors.greenAccent,
    location: "CCI College, Room G-05",
    hours: "Mon-Fri: 8:30 AM - 5:00 PM",
    contact: "+251-000-000-000",
  ),
  ServiceModel(
    title: "Registrar Office",
    description: "Handle course registration, transcripts, ID cards.",
    icon: CupertinoIcons.doc_text_fill,
    color: Colors.indigoAccent,
    location: "Admin Building, Room 101",
    hours: "Mon-Fri: 8:30 AM - 5:00 PM",
    contact: "+251-000-000-000",
  ),
  ServiceModel(
    title: "Transportation Office",
    description: "Bus schedules, shuttle routes, and transport passes.",
    icon: CupertinoIcons.bus,
    color: Colors.teal,
    location: "Near Main Gate,Parking lot",
    hours: "Mon-Fri: 9:00 AM - 4:00 PM",
  ),
  ServiceModel(
    title: "Security Office",
    description: "Campus safety and lost item reporting.",
    icon: CupertinoIcons.shield_fill,
    color: Colors.deepPurpleAccent,
    location: "Main Gate & All Campus Entrances",
    hours: "24/7",
    contact: "000 (Emergency)",
  ),
  ServiceModel(
    title: "Cafeteria Administration",
    description: "Cafeteria management and meal ticket inquiries.",
    icon: CupertinoIcons.bag_fill,
    color: Colors.pinkAccent,
    location: "Muslim Students Cafeteria",
    hours: "Daily: 9:00 AM - 5:00 PM",
  ),
  ServiceModel(
    title: "Maintenance & Electricity",
    description: "Report electric or water maintenance issues.",
    icon: CupertinoIcons.hammer_fill,
    color: Colors.brown,
    contact: "000 (Hotline)",
    location: "building 1",
    hours: "Daily: 9:00 AM - 5:00 PM",
  ),
  ServiceModel(
    title: "Lost & Found Office",
    description: "Report or claim lost items. "
    "if it is simple just contact haramaya general admin",
    icon: CupertinoIcons.search_circle_fill,
    color: Colors.cyan,
    location: "Building 1 ",
    hours: "Mon-Fri: 10:00 AM - 4:00 PM",
  ),
  ServiceModel(
    title: "Printing & Photocopy",
    description: "Printing, scanning, and document services.",
    icon: CupertinoIcons.printer_fill,
    color: Colors.deepOrangeAccent,
    location: "Various locations near Library & dorms",
    hours: "Typically 8:00 AM - 6:00 PM",
  ),
  ServiceModel(
    title: "Student Union Office",
    description: "Student representation and event organization.",
    icon: CupertinoIcons.person_3_fill,
    color: Colors.amber,
    location: "Student Union Building 1, 1st Floor",
    hours: "Mon-Sat: 9:00 AM - 5:00 PM",
  ),
];

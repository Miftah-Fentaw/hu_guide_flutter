import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Location {
  final String name;
  final String type;
  final String location;
  final String? hours;
  final String? phone;
  final IconData icon;
  final String? status;

  // ADD THESE ↓↓↓↓↓
  final double lat;
  final double lng;

  Location({
    required this.name,
    required this.type,
    required this.location,
    this.hours,
    this.phone,
    required this.icon,
    this.status,
    required this.lat,   // NEW
    required this.lng,   // NEW
  });
}


final buildings = [
  Location(
    name: "Main Library",
    type: "Academic Building",
    location: "Central Campus, Building A",
    hours: "Mon-Sat: 24/7 access",
    icon: CupertinoIcons.book,
    lat: 9.4095,
    lng: 42.0407,
  ),
  Location(
    name: "LAW Library",
    type: "Academic Building",
    location: "Central Campus, Building A",
    hours: "Mon-Fri: 8:00 AM - 10:00 PM",
    icon: CupertinoIcons.book,
    lat: 9.4097,
    lng: 42.0410,
  ),
  Location(
    name: "CCI College",
    type: "Academic Building",
    location: "North Campus, Building B",
    hours: "Mon-Fri: 7:00 AM - 11:00 PM",
    icon: CupertinoIcons.device_laptop,
    lat: 9.4109,
    lng: 42.0382,
  ),
  Location(
    name: "Student Union",
    type: "Strong Student Voice",
    location: "Central Campus",
    hours: "24/7 access",
    icon: CupertinoIcons.group,
    lat: 9.4091,
    lng: 42.0404,
  ),
  Location(
    name: "Afran Kalo Hall",
    type: "Residence Hall",
    location: "North Campus",
    hours: "Mon-Sun: 6:00 AM - 12:00 AM",
    icon: CupertinoIcons.home,
    lat: 9.4204,
    lng: 42.0372,
  ),
  Location(
    name: "Resource Center",
    type: "Hall",
    location: "Campus entry",
    hours: "Privileges Access",
    icon: CupertinoIcons.home,
    lat: 9.4069,
    lng: 42.0399,
  ),
  Location(
    name: "Old Afran Kallo",
    type: "Hall",
    location: "around classrooms",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4112,
    lng: 42.0400,
  ),
];


  final dorms = [
  Location(
    name: "WING",
    type: "MALE Dorm",
    location: "Alongside main street",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4086,
    lng: 42.0407,
  ),
  Location(
    name: "AMEL 1,2,3",
    type: "MALE DORM",
    location: "Male dorms last building",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4083,
    lng: 42.0414,
  ),
  Location(
    name: "SAT",
    type: "MALE Dorm",
    location: "Besides Wing",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4089,
    lng: 42.0405,
  ),
  Location(
    name: "DMC 1,2",
    type: "MALE DORM",
    location: "Back of female dorms",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4092,
    lng: 42.0418,
  ),
  Location(
    name: "WHITE HOUSE",
    type: "FEMALE Dorm compound entry point",
    location: "North Campus",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4107,
    lng: 42.0394,
  ),
  Location(
    name: "QUEEN 1,2,3",
    type: "FEMALE DORM",
    location: "Dorms compound end point",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4113,
    lng: 42.0391,
  ),
  Location(
    name: "Building 1,2,3",
    type: "MALE DORM",
    location: "Around Main Library",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4098,
    lng: 42.0402,
  ),
  Location(
    name: "Masters",
    type: "Male Dorm",
    location: "Beside CCI college",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.4113,
    lng: 42.0379,
  ),
];


   final Cafes = [
  Location(
    name: "MUSLIMS",
    type: "around Main library",
    location: "Student Center, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4093,
    lng: 42.0406,
  ),
  Location(
    name: "SENIOR CHRISTIAN",
    type: "behind the clinic",
    location: "Student Center, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4100,
    lng: 42.0413,
  ),
  Location(
    name: "FRESH CHRISTIAN",
    type: "around SSA (stadium)",
    location: "Student Center",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4120,
    lng: 42.0389,
  ),
  Location(
    name: "KT",
    type: "PRIVATE",
    location: "SSA (stadium)",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4116,
    lng: 42.0385,
  ),
  Location(
    name: "KIRU",
    type: "PRIVATE",
    location: "AMEL 1 floor",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4084,
    lng: 42.0413,
  ),
  Location(
    name: "WOLLEGA",
    type: "PRIVATE",
    location: "behind Oromia",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4108,
    lng: 42.0409,
  ),
  Location(
    name: "Wing",
    type: "PRIVATE",
    location: "Wing, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4086,
    lng: 42.0407,
  ),
  Location(
    name: "Oromia",
    type: "Shop",
    location: "around Square",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4106,
    lng: 42.0408,
  ),
  Location(
    name: "DMC",
    type: "PRIVATE",
    location: "DMC, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4091,
    lng: 42.0415,
  ),
  Location(
    name: "WOLLEGA CAFE",
    type: "PRIVATE CAFE",
    location: "Student Center, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.4095,
    lng: 42.0409,
  ),
    ];

    final offices = [
  Location(
    name: "Registrar's Office",
    type: "Parking Lot main campus",
    location: "Admin Building, Room 101",
    hours: "Mon-Fri: 9:00 AM - 5:00 PM",
    icon: Icons.house_siding_outlined,
    lat: 9.4097,
    lng: 42.0401,
  ),
  Location(
    name: "HEAD QUARTER",
    type: "BUREAU Services",
    location: "Parking Lot",
    hours: "Mon-Fri: 9:00 AM - 5:00 PM",
    icon: Icons.house_siding_outlined,
    lat: 9.4098,
    lng: 42.0403,
  ),
  Location(
    name: "STUDENT SERVICE",
    type: "Student Services",
    location: "Senior Christian Café Area",
    hours: "Mon-Fri: 9:00 AM - 5:00 PM",
    icon: Icons.house_siding_outlined,
    lat: 9.4101,
    lng: 42.0412,
  ),
  Location(
    name: "ACADEMIC AFFAIRS",
    type: "ACADEMIA Services",
    location: "Admin Building, Room 105",
    hours: "Mon-Fri: 9:00 AM - 5:00 PM",
    icon: Icons.house_siding_outlined,
    lat: 9.4096,
    lng: 42.0400,
  ),
  Location(
    name: "Book Store",
    type: "Store",
    location: "Around classrooms",
    hours: "Mon-Fri: 9:00 AM - 5:00 PM",
    icon: Icons.house_siding_outlined,
    lat: 9.4092,
    lng: 42.0409,
  ),
  Location(
    name: "Student Union",
    type: "Student Services",
    location: "Building 1",
    hours: "Mon-Fri: 9:00 AM - 5:00 PM",
    icon: Icons.house_siding_outlined,
    lat: 9.4099,
    lng: 42.0404,
  ),
];


    
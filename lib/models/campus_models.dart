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

  Location({
    required this.name,
    required this.type,
    required this.location,
    this.hours,
    this.phone,
    required this.icon,
    this.status,
  });
}

final buildings = [
      Location(
        name: "Main Library",
        type: "Academic Building",
        location: "Central Campus, Building A",
        hours: "Mon-Sat: 24/7 access",
        icon: CupertinoIcons.book,
      ),
      Location(
        name: "LAW Library",
        type: "Academic Building",
        location: "Central Campus, Building A",
        hours: "Mon-Fri: 8:00 AM - 10:00 PM",
        icon: CupertinoIcons.book,
      ),
      Location(
        name: "CCI College",
        type: "Academic Building",
        location: "North Campus, Building B",
        hours: "Mon-Fri: 7:00 AM - 11:00 PM",
        icon: CupertinoIcons.device_laptop,
      ),
      Location(
        name: "Student Union",
        type: "Strong Student Voice",
        location: "Central Campus",
        hours: "24/7 access",
        icon: CupertinoIcons.group,
      ),
      Location(
        name: "Afran Kalo Hall",
        type: "Residence Hall",
        location: "North Campus",
        hours: "Mon-Sun: 6:00 AM - 12:00 AM",
        icon: CupertinoIcons.home,
      ),
      Location(
        name: "Resource Center",
        type: "Hall ",
        location: "Campus entry",
        hours: "previllages Access",
        icon: CupertinoIcons.home,
      ),
      Location(
        name: "Old Afran Kallo",
        type: "Hall ",
        location: "around classrooms",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),
      Location(
        name: "Resource Center",
        type: "Hall ",
        location: "Campus entry",
        hours: "previllages Access",
        icon: CupertinoIcons.home,
      ),
    ];

    final dorms = [
      Location(
        name: "WING",
        type: "MALE Dorm",
        location: "alongside main strret ",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),
      Location(
        name: "AMEL 1,2,3",
        type: "MALE DORM",
        location: "male dorms last building",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),
       Location(
        name: "SAT",
        type: "MALE Dorm",
        location: "Besides WIng",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),
      Location(
        name: "DMC 1,2",
        type: "MALE DORM",
        location: "back of female dorms",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),
       Location(
        name: "WHITE HOUSE",
        type: "FEMALE Dorm compound entry point",
        location: "North Campus",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),
      Location(
        name: "QUEEN 1,2,3",
        type: "FEMALE DORM",
        location: "female dorms compound end point",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),
      Location(
        name: "Building 1,2,3",
        type: "MALE DORM",
        location: "around Main Library",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),
      Location(
        name: "Masters",
        type: "Male Dorm",
        location: "besides CCI college ",
        hours: "24/7 Access",
        icon: CupertinoIcons.home,
      ),

    ];

    final Cafes = [
      Location(
        name: "MUSLIMS ",
        type: "around Main library",
        location: "Student Center, Floor 1",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
      Location(
        name: "SENIOR CHRISTIAN ",
        type: "behind the <clinic ",
        location: "Student Center, Floor 1",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
      Location(
        name: "FRESH CHRISTIAN ",
        type: "around SSA(stadium) ",
        location: "Student Center, Floor 1",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
      Location(
        name: "KT ",
        type: "PRIVATE ",
        location: "SSA(stadium)",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
      Location(
        name: "KIRU ",
        type: "PRIVATE ",
        location: "AMEL 1 floor",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
      Location(
        name: "WOLLEGA ",
        type: "PRIVATE ",
        location: "behind oromiya",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
       Location(
        name: "Wing ",
        type: "PRIVATE ",
        location: "wing, Floor 1",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
       Location(
        name: "Oromia",
        type: "Shop",
        location: "around square",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
       Location(
        name: "DMC",
        type: "PRIVATE ",
        location: "dmc, Floor 1",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
       Location(
        name: "WOLLEGA CAFE",
        type: "PRIVATE CAFE",
        location: "Student Center, Floor 1",
        hours: "Mon-Fri: 7:00 AM - 8:00 PM",
        icon: Icons.restaurant,
      ),
    ];

    final offices = [
      Location(
        name: "Registrar's Office",
        type: "Parking Lot main campus",
        location: "Admin Building, Room 101",
        hours: "Mon-Fri: 9:00 AM - 5:00 PM",
        icon: Icons.house_siding_outlined,
      ),
      Location(
        name: "HEAD QUARTER",
        type: "BUREAU Services",
        location: "Praking lot",
        hours: "Mon-Fri: 9:00 AM - 5:00 PM",
        icon: Icons.house_siding_outlined,
      ),
      Location(
        name: "STUDENT SERVICE",
        type: "Student Services",
        location: "senior CHristian cafe",
        hours: "Mon-Fri: 9:00 AM - 5:00 PM",
        icon: Icons.house_siding_outlined,
      ),
      Location(
        name: "ACADEMIC AFFAIRS",
        type: "ACADEMIA Services",
        location: "Admin Building, Room 105",
        hours: "Mon-Fri: 9:00 AM - 5:00 PM",
        icon: Icons.house_siding_outlined,
      ),
      Location(
        name: "Book Store",
        type: "Store",
        location: "around classrooms",
        hours: "Mon-Fri: 9:00 AM - 5:00 PM",
        icon: Icons.house_siding_outlined,
      ),
      Location(
        name: "Student Union",
        type: "Student Services",
        location: "Building 1",
        hours: "Mon-Fri: 9:00 AM - 5:00 PM",
        icon: Icons.house_siding_outlined,
      ),

    ];
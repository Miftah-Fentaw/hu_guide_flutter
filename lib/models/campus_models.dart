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
    lat: 9.422984073151095,
    lng: 42.034021303129336,
  ),
  Location(
    name: "LAW Library",
    type: "Academic Building",
    location: "Central Campus, Building A",
    hours: "Mon-Fri: 8:00 AM - 10:00 PM",
    icon: CupertinoIcons.book,
    lat: 9.420571993600314,
    lng: 42.03492765942484,
  ),
  Location(
    name: "CCI College",
    type: "Academic Building",
    location: "North Campus, Building B",
    hours: "Mon-Fri: 7:00 AM - 11:00 PM",
    icon: CupertinoIcons.device_laptop,
    lat: 9.421713361423748,
    lng: 42.03313723600998,
  ),
  Location(
    name: "Student Union",
    type: "Strong Student Voice",
    location: "Central Campus",
    hours: "24/7 access",
    icon: CupertinoIcons.group,
    lat: 9.423706616796455,
    lng: 42.033915862551225,
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
    lat: 9.42037889794694, 
    lng:42.03719183663422,
  ),
  Location(
    name: "Auditorium Kallo",
    type: "Hall",
    location: "around classrooms",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat:9.422640859650464, 
    lng:42.03331803881942
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
    lat:  9.4253140063867, 
    lng: 42.03259902914729,
  ),
  Location(
    name: "SAT 1",
    type: "MALE Dorm",
    location: "Besides Wing",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.425686809204064, 
    lng:42.03338586075698,
  ),
  Location(
    name: "DMC 1,2",
    type: "MALE DORM",
    location: "Back of female dorms",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.426324775165874, 
    lng: 42.034099546715574,
  ),
  Location(
    name: "WHITE HOUSE",
    type: "FEMALE Dorm compound entry point",
    location: "North Campus",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.424786476149256, 
    lng: 42.03398577428328,
  ),
  Location(
    name: "QUEEN 1,2,3",
    type: "FEMALE DORM",
    location: "Dorms compound end point",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.424865702016291, 
    lng: 42.03365616885986,
  ),
  Location(
    name: "Building 1,2,3",
    type: "MALE DORM",
    location: "Around Main Library",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.423910038761996, 
    lng: 42.03407444986679,
  ),
  Location(
    name: "Masters",
    type: "Male Dorm",
    location: "Beside CCI college",
    hours: "24/7 Access",
    icon: CupertinoIcons.home,
    lat: 9.422421245489833,
    lng:  42.03262552454324,
  ),
];


   final Cafes = [
  Location(
    name: "MUSLIMS",
    type: "around Main library",
    location: "Student Center, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.423639847086147, 
    lng: 42.034999671072256,
  ),
  Location(
    name: "SENIOR CHRISTIAN",
    type: "behind the clinic",
    location: "Student Center, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.42419800353489, 
    lng: 42.03514450536468,
  ),
  Location(
    name: "FRESH CHRISTIAN",
    type: "around SSA (stadium)",
    location: "Student Center",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.423653272638399, 
    lng: 42.03205016564241,
  ),
  Location(
    name: "KT",
    type: "PRIVATE",
    location: "SSA (stadium)",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.425427436688524, 
    lng:42.03043858791445,
  ),
  Location(
    name: "KIRU",
    type: "PRIVATE",
    location: "AMEL 1 floor",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.425746197558931, 
    lng: 42.03290423000783,
  ),
  Location(
    name: "WOLLEGA",
    type: "PRIVATE",
    location: "behind Oromia",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.423724377385248, 
    lng:42.03283433862972,
  ),
  Location(
    name: "Wing",
    type: "PRIVATE",
    location: "Wing, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.424880333897882, 
    lng: 42.03322512839619
  ),
  Location(
    name: "Oromia",
    type: "Shop",
    location: "around Square",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.423969880918872, 
    lng:42.03286897184962
  ),
  Location(
    name: "DMC",
    type: "PRIVATE",
    location: "DMC, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.426447651696096, 
    lng:42.03436173237623
  ),
  Location(
    name: "WOLLEGA CAFE",
    type: "PRIVATE CAFE",
    location: "Student Center, Floor 1",
    hours: "Mon-Fri: 7:00 AM - 8:00 PM",
    icon: Icons.restaurant,
    lat: 9.423669105073698, 
    lng:42.03274358014062
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


    
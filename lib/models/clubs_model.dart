class Organisation {
  final String president;
  final String name;
  final int number_of_students;
  final String About;
  final String address;
  final String contact;
  final String imagepath;
  final List<String> actions;

  Organisation({
    required this.president,
    required this.name,
    required this.number_of_students,
    required this.About,
    required this.address,
    required this.contact,
    required this.imagepath,
    required this.actions,
  });
}

List<Organisation> clubs = [
  Organisation(
  president: "Mohammed Abdulahi",
  name: "Haramaya University Computing and Informatics Students Association (HUCIA)",
  number_of_students: 180,
  About:
      "HUCIA is a student-led technology and innovation club at Haramaya University dedicated to empowering computing and IT students through coding workshops, hackathons, and tech community activities. The club bridges classroom learning with real-world problem-solving and industry exposure.",
  address: "Haramaya University Main Campus, College of Computing and Informatics Building",
  contact: "+251 912 345 678",
  imagepath: "assets/clubs/cci.png",
  actions: [
    "Organized university-level hackathons and coding competitions",
    "Conducted peer-to-peer programming and cybersecurity workshops",
    "Collaborated with industry professionals for tech talks",
    "Developed student projects and open-source contributions",
    "Supported first-year students through mentorship programs",
  ],
),

  Organisation(
    president: "Elsabet Alemu Alemu",
    name: "Haramaya University Economics Students Association (HUESA)",
    number_of_students: 100,
    About:
        "An association formed for networking economics students in Haramaya University, bridging industry–academy gap. :contentReference[oaicite:1]{index=1}",
    address: "Haramaya Uiversity Main Campus Building 1",
    contact: "+251 911 234 567",
    imagepath: "assets/clubs/huesa.png",
    actions: [
      "actions atken one",
      "actions atken two",
      "actions atken three",
      "actions atken four",
      "actions atken five",
    ],
  ),
  Organisation(
    president: "Abrham Habtamu",
    name: "HULSA (Haramaya University Law Students Association)",
    number_of_students: 200,
    About:
        "Official association for law students at Haramaya University. :contentReference[oaicite:3]{index=3}",
    address: "Haramaya Uiversity Main Campus Building 1",
    contact: "+251 911 234 567",
    imagepath: "assets/clubs/hulsa.png",
    actions: [
      "actions atken one",
      "actions atken two",
      "actions atken three",
      "actions atken four",
      "actions atken five",
    ],
  ),
  Organisation(
    president: "Amanuel Mekuanint",
    name: "Disability Club",
    number_of_students: 50,
    About:
        "A student club dedicated to helping under-privileged students through food distribution and connecting with professionals. :contentReference[oaicite:4]{index=4}",
    address: "Haramaya Uiversity Main Campus Building 1",
    contact: "+251 911 234 567",
    imagepath: "assets/clubs/huda.png",
    actions: [
      "actions atken one",
      "actions atken two",
      "actions atken three",
      "actions atken four",
      "actions atken five",
    ],
  ),
];

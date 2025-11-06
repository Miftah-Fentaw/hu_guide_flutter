class College {
  final String dean;
  final String college_name;
  final String short_name;
  final int number_of_students;
  final String About;
  final String misssion;
  final List<String> programs;
  final List<String> departments;
  final String imagepath;
  final String location;
  final String contact;

  College({
    required this.imagepath,
    required this.dean,
    required this.short_name,
    required this.number_of_students,
    required this.About,
    required this.misssion,
    required this.programs,
    required this.departments,
    required this.college_name,
    required this.location,
    required this.contact,
  });
}

final List<College> colleges = [
  College(
    imagepath: 'assets/colleges/agriculture.png',
    dean: 'Dr. Agriculture President',
    short_name: 'CAES',
    number_of_students: 3200,
    About:
        'The College of Agriculture and Environmental Sciences is one of the oldest and largest colleges at Haramaya University. It focuses on agricultural innovation, sustainability, and environmental protection.',
    misssion:
        'To produce competent professionals and conduct research addressing food security and sustainable natural resource management.',
    programs: [
      'BSc in Plant Sciences',
      'BSc in Animal Sciences',
      'BSc in Agricultural Economics',
      'MSc in Soil and Water Management',
    ],
    departments: [
      'Department of Plant Sciences',
      'Department of Animal Sciences',
      'Department of Natural Resource Management',
      'Department of Agricultural Economics',
    ],
    college_name: 'College of Agriculture and Environmental Sciences',
    location: 'Haramaya University Main Campus',
    contact: '+251 911 123 456',
  ),

  College(
    imagepath: 'assets/colleges/engineering.png',
    dean: 'Eng. Engineering Dean',
    short_name: 'CET',
    number_of_students: 2700,
    About:
        'The College of Engineering and Technology provides practical and research-based education in various fields of engineering and technology.',
    misssion:
        'To produce highly skilled engineers capable of solving real-world technological challenges through innovation and teamwork.',
    programs: [
      'BSc in Civil Engineering',
      'BSc in Computer Engineering',
      'BSc in Electrical Engineering',
      'BSc in Mechanical Engineering',
    ],
    departments: [
      'Civil Engineering Department',
      'Computer Engineering Department',
      'Electrical and Computer Engineering Department',
      'Mechanical Engineering Department',
    ],
    college_name: 'College of Engineering and Technology',
    location: 'Haramaya University Main Campus',
    contact: '+251 911 234 567',
  ),

  College(
    imagepath: 'assets/colleges/health.png',
    dean: 'Dr. Health Dean',
    short_name: 'CHMS',
    number_of_students: 2100,
    About:
        'The College of Health and Medical Sciences trains professionals in medicine, nursing, and public health while conducting community-based medical outreach.',
    misssion:
        'To improve community health through education, research, and medical service delivery.',
    programs: [
      'BSc in Pediatric',
      'BSc in HO'
      'BSc in Public Health'
      'Doctor of Medicine (MD)',
      'BSc in Pharmacy'
      'BSc in Pschatric',
      'BSc in Nursing',
      'MSc in Reproductive Health',
    ],
    departments: [
      'Department of Public Health',
      'Department of Nursing',
      'Department of Medicine',
      'Department of Midwifery',
    ],
    college_name: 'College of Health and Medical Sciences',
    location: 'Haramaya University Campus',
    contact: '+251 911 345 678',
  ),

  College(
    imagepath: 'assets/colleges/computing.png',
    dean: 'Mr. Afendi ',
    short_name: 'CCI',
    number_of_students: 1800,
    About:
        'The College of Computing and Informatics focuses on computer science, information technology, and emerging areas such as AI and cybersecurity.',
    misssion:
        'To empower students with technological and analytical skills to lead the digital transformation of Ethiopia and beyond.',
    programs: [
      'BSc in Computer Science',
      'BSc in Statics and Probability'
      'BSc in Information Technology',
      'BSc in Information Science',
      'BSc in Information System',
      'BSc in Software Engineering',
      'MSc in Computer Science',
    ],
    departments: [
      'Department of Software Eninering',
      'Department of Information Technology',
      'Department of Information System',
      'Department of Computer Science',
      'Department of Information Science',
      'Department of Statics',
    ],
    college_name: 'College of Computing and Informatics',
    location: 'Haramaya University Main Campus',
    contact: '+251 911 456 789',
  ),
];

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
    dean: 'Dr. Lemma Wuletaw (Dean, College of Agriculture and Environmental Sciences)',
    short_name: 'CAES',
    number_of_students: 4500,
    About:
        'The College of Agriculture and Environmental Sciences (CAES) is one of the oldest and largest colleges at Haramaya University, originally established as the Imperial Ethiopian College of Agriculture and Mechanical Arts in 1954. It focuses on agricultural innovation, sustainability, environmental protection, and natural resource management, offering practical and research-based education to address Ethiopia\'s agricultural challenges.',
    misssion:
        'To produce competent professionals equipped with knowledge and skills in agricultural and environmental sciences, conduct cutting-edge research addressing food security, climate resilience, and sustainable natural resource management, and provide transformative community services for rural development.',
    programs: [
      'BSc in Plant Sciences',
      'BSc in Horticulture',
      'BSc in Animal Sciences',
      'BSc in Agricultural Economics',
      'BSc in Natural Resource Management',
      'BSc in Rural Development and Agricultural Extension',
      'MSc in Soil and Water Management',
      'MSc in Crop Protection',
      'MSc in Animal Production',
      'PhD in Plant Pathology',
    ],
    departments: [
      'Department of Plant Sciences',
      'Department of Horticulture and Plant Breeding',
      'Department of Animal and Range Sciences',
      'Department of Agricultural Economics and Agribusiness',
      'Department of Natural Resources Management',
      'Department of Rural Development and Agricultural Extension',
    ],
    college_name: 'College of Agriculture and Environmental Sciences',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-531988',
  ),
  College(
    imagepath: 'assets/colleges/engineering.png',
    dean: 'Dr. Samuel Tadesse (Dean, Haramaya Institute of Technology)',
    short_name: 'HIT',
    number_of_students: 3500,
    About:
        'The Haramaya Institute of Technology (HIT), formerly part of the College of Engineering, provides cutting-edge education and training in engineering disciplines, emphasizing innovation, practical skills, and industry collaboration to drive technological advancement in Ethiopia.',
    misssion:
        'To produce highly skilled engineers and technologists capable of solving real-world technological challenges through innovative research, teamwork, and sustainable engineering practices that contribute to national development.',
    programs: [
      'BSc in Civil Engineering',
      'BSc in Electrical Engineering',
      'BSc in Mechanical Engineering',
      'BSc in Chemical Engineering',
      'BSc in Construction Technology and Management',
      'BSc in Computer Engineering',
      'MSc in Civil Engineering',
      'MSc in Electrical Power Engineering',
      'MSc in Thermal Engineering',
    ],
    departments: [
      'Department of Civil and Environmental Engineering',
      'Department of Electrical and Computer Engineering',
      'Department of Mechanical and Industrial Engineering',
      'Department of Chemical Engineering',
      'Department of Construction Technology and Management',
    ],
    college_name: 'Haramaya Institute of Technology',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-530993',
  ),
  College(
    imagepath: 'assets/colleges/health.png',
    dean: 'Dr. Solomon Tsegaye (Dean, College of Health and Medical Sciences)',
    short_name: 'CHMS',
    number_of_students: 2500,
    About:
        'The College of Health and Medical Sciences (CHMS) trains healthcare professionals through community-based education, research, and outreach programs, operating in collaboration with Hiwot Fana Specialized University Teaching Hospital to improve public health outcomes in eastern Ethiopia.',
    misssion:
        'To improve community health through high-quality education of medical and health professionals, innovative research on prevalent health issues, and delivery of accessible medical services that promote preventive care and disease management.',
    programs: [
      'Doctor of Medicine (MD)',
      'BSc in Nursing',
      'BSc in Public Health',
      'BSc in Medical Laboratory Sciences',
      'BSc in Pharmacy',
      'BSc in Midwifery',
      'BSc in Psychiatry Nursing',
      'BSc in Neonatal Nursing',
      'MSc in Integrated Emergency Obstetrics and Newborn Care',
      'MSc in Public Health',
    ],
    departments: [
      'Department of Community Health',
      'Department of Medical Laboratory Sciences',
      'Department of Nursing',
      'Department of Obstetrics and Gynecology',
      'Department of Pediatrics and Child Health',
      'Department of Internal Medicine',
    ],
    college_name: 'College of Health and Medical Sciences',
    location: 'Harar Campus, Hiwot Fana Specialized University Teaching Hospital, Harar, Ethiopia',
    contact: '+251-255-531988',
  ),
  College(
    imagepath: 'assets/colleges/computing.png',
    dean: 'Dr. Worku Gelaw (Dean, College of Computing and Informatics)',
    short_name: 'CCI',
    number_of_students: 2000,
    About:
        'The College of Computing and Informatics (CCI) specializes in computer science, information systems, and informatics, preparing students for the digital economy through hands-on training in software development, data management, and emerging technologies like AI and cybersecurity.',
    misssion:
        'To empower students with advanced technological and analytical skills to lead Ethiopia\'s digital transformation, foster innovation in computing research, and produce graduates who drive information technology solutions for societal challenges.',
    programs: [
      'BSc in Computer Science',
      'BSc in Information Technology',
      'BSc in Information Systems',
      'BSc in Software Engineering',
      'BSc in Information Science',
      'BSc in Statistics',
      'MSc in Computer Science',
      'MSc in Information Systems',
      'MSc in Data Science',
    ],
    departments: [
      'Department of Computer Science',
      'Department of Information Technology',
      'Department of Information Systems',
      'Department of Software Engineering',
      'Department of Information Science',
      'Department of Mathematics and Statistics',
    ],
    college_name: 'College of Computing and Informatics',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-531988',
  ),
  College(
    imagepath: 'assets/colleges/business.png',
    dean: 'Dr. Mohammednur Legamo (Dean, College of Business and Economics)',
    short_name: 'CBE',
    number_of_students: 3000,
    About:
        'The College of Business and Economics (CBE) offers comprehensive programs in management, economics, and related fields, focusing on entrepreneurial skills, economic policy analysis, and business innovation to support Ethiopia\'s growing economy.',
    misssion:
        'To produce ethical and competent business leaders and economists through rigorous academic training, applied research on economic development, and community engagement that promotes sustainable business practices and financial inclusion.',
    programs: [
      'BBA in Accounting and Finance',
      'BBA in Management',
      'BBA in Marketing Management',
      'BA in Economics',
      'BSc in Logistics and Supply Chain Management',
      'MSc in Development Economics',
      'MSc in Accounting and Finance',
      'MBA in General Management',
    ],
    departments: [
      'Department of Accounting and Finance',
      'Department of Management',
      'Department of Economics',
      'Department of Marketing Management',
      'Department of Logistics and Supply Chain Management',
    ],
    college_name: 'College of Business and Economics',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-531988',
  ),
  College(
    imagepath: 'assets/colleges/social.png',
    dean: 'Dr. Gemechu Gota (Dean, College of Social Sciences and Humanities)',
    short_name: 'CSSH',
    number_of_students: 2800,
    About:
        'The College of Social Sciences and Humanities (CSSH) explores human behavior, culture, languages, and societal issues through interdisciplinary programs, promoting critical thinking, cultural preservation, and social justice in Ethiopia.',
    misssion:
        'To cultivate informed citizens and scholars who advance social research, preserve cultural heritage, and contribute to national development by addressing social inequalities, governance challenges, and humanistic values.',
    programs: [
      'BA in English Language and Literature',
      'BA in Sociology and Social Work',
      'BA in Geography and Environmental Studies',
      'BA in History and Heritage Management',
      'BA in Philosophy',
      'BA in Psychology',
      'BA in Tourism Management',
      'MA in Applied Linguistics',
      'MA in Social Anthropology',
      'MA in Development Studies',
    ],
    departments: [
      'Department of English Language and Literature',
      'Department of Foreign Languages and Journalism',
      'Department of Sociology and Social Anthropology',
      'Department of Geography and Environmental Studies',
      'Department of History, Archaeology and Heritage Management',
      'Department of Philosophy',
      'Department of Psychology',
    ],
    college_name: 'College of Social Sciences and Humanities',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-531988',
  ),
  College(
    imagepath: 'assets/colleges/law.png',
    dean: 'Dr. Mohammed Abdela (Dean, College of Law)',
    short_name: 'COL',
    number_of_students: 1200,
    About:
        'The College of Law (COL) provides rigorous legal education grounded in Ethiopian and international law, preparing students for careers in judiciary, advocacy, and public service through clinical training and research.',
    misssion:
        'To produce principled legal professionals committed to justice, human rights, and the rule of law, while conducting research that informs policy and promotes legal reforms for a democratic Ethiopia.',
    programs: [
      'LLB in Law',
      'LLM in Constitutional and Administrative Law',
      'LLM in Business Law',
      'LLM in Human Rights Law',
    ],
    departments: [
      'Department of Law',
    ],
    college_name: 'College of Law',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-531988',
  ),
  College(
    imagepath: 'assets/colleges/veterinary.png',
    dean: 'Prof. Fekadu Adugna (Dean, College of Veterinary Medicine)',
    short_name: 'CVM',
    number_of_students: 800,
    About:
        'The College of Veterinary Medicine (CVM) focuses on animal health, production, and welfare, offering specialized training to combat livestock diseases and enhance food security in pastoral communities.',
    misssion:
        'To train expert veterinarians and conduct research on zoonotic diseases and animal production systems, providing veterinary extension services to improve livestock health and contribute to Ethiopia\'s agricultural economy.',
    programs: [
      'DVM in Veterinary Medicine',
      'MSc in Veterinary Surgery',
      'MSc in Veterinary Epidemiology',
      'MSc in Veterinary Public Health',
    ],
    departments: [
      'Department of Clinical Studies',
      'Department of Biomedical Sciences',
      'Department of Veterinary Surgery and Theriogenology',
      'Department of Veterinary Pathology and Parasitology',
      'Department of Veterinary Epidemiology and Public Health',
    ],
    college_name: 'College of Veterinary Medicine',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-531988',
  ),
  College(
    imagepath: 'assets/colleges/natural.png',
    dean: 'Dr. Yadeta Bekele (Dean, College of Natural and Computational Sciences)',
    short_name: 'CNCS',
    number_of_students: 2200,
    About:
        'The College of Natural and Computational Sciences (CNCS) advances knowledge in pure and applied sciences, fostering scientific inquiry, computational modeling, and innovation in physics, chemistry, biology, and mathematics.',
    misssion:
        'To produce scientists who excel in research and application of natural and computational sciences, solving environmental and health challenges through interdisciplinary approaches and technology integration.',
    programs: [
      'BSc in Biology',
      'BSc in Chemistry',
      'BSc in Physics',
      'BSc in Mathematics',
      'BSc in Sport Science',
      'BSc in Applied Physics',
      'MSc in Applied Mathematics',
      'MSc in Organic Chemistry',
      'MSc in Biotechnology',
    ],
    departments: [
      'Department of Biology',
      'Department of Chemistry',
      'Department of Physics',
      'Department of Mathematics',
      'Department of Sport Science',
      'Department of Biotechnology',
    ],
    college_name: 'College of Natural and Computational Sciences',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-531988',
  ),
  College(
    imagepath: 'assets/colleges/education.png',
    dean: 'Dr. Adugna Korsa (Dean, College of Education and Behavioral Sciences)',
    short_name: 'CEBS',
    number_of_students: 2600,
    About:
        'The College of Education and Behavioral Sciences (CEBS) prepares educators, counselors, and behavioral specialists through pedagogy, psychology, and inclusive education programs, supporting Ethiopia\'s teacher training needs.',
    misssion:
        'To develop competent educators and behavioral experts who promote quality teaching, lifelong learning, and psychological well-being, while researching educational policies and behavioral interventions for diverse learners.',
    programs: [
      'BEd in English Language Teaching',
      'BEd in Mathematics',
      'BEd in Physics',
      'BEd in Biology',
      'BEd in History',
      'BEd in Civic and Ethical Studies',
      'BSc in Psychology',
      'MEd in Curriculum and Instruction',
      'MEd in Educational Leadership',
      'MSc in Clinical Psychology',
    ],
    departments: [
      'Department of Language and Literature Education',
      'Department of Mathematics and Geography Education',
      'Department of Natural Science Education',
      'Department of Social Science Education',
      'Department of Educational Planning and Management',
      'Department of Special Needs and Inclusive Education',
      'Department of Psychology and Counseling',
    ],
    college_name: 'College of Education and Behavioral Sciences',
    location: 'Haramaya University Main Campus, Haramaya, Oromia Region',
    contact: '+251-255-531988',
  ),
];
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
    president: "Elsabet Alemu",
    name: "Haramaya University Economics Students Association (HUESA)",
    number_of_students: 100,
    About:
        "HUESA is a vibrant student association at Haramaya University that connects economics students with industry professionals, fostering networking, economic discussions, and practical skills development to bridge the gap between academia and the job market.",
    address: "Haramaya University Main Campus, College of Business and Economics Building",
    contact: "+251 911 234 567",
    imagepath: "assets/clubs/huesa.png",
    actions: [
      "Hosted economic policy seminars and guest speaker sessions with economists",
      "Organized career fairs and internships networking events with local businesses",
      "Conducted research workshops on Ethiopian economic trends",
      "Launched student-led economic journals and debate clubs",
      "Collaborated with NGOs for community economic impact projects",
    ],
  ),
  Organisation(
    president: "Abrham Habtamu",
    name: "HULSA (Haramaya University Law Students Association)",
    number_of_students: 200,
    About:
        "HULSA serves as the official association for law students at Haramaya University, promoting legal education, advocacy skills, and awareness of human rights and justice issues through moot courts, legal aid clinics, and policy debates.",
    address: "Haramaya University Main Campus, College of Law Building",
    contact: "+251 911 345 678",
    imagepath: "assets/clubs/hulsa.png",
    actions: [
      "Conducted annual moot court competitions and legal simulations",
      "Provided free legal aid to underprivileged community members",
      "Organized seminars on Ethiopian constitutional law and international treaties",
      "Published student law review journals on emerging legal topics",
      "Advocated for gender equality and anti-corruption initiatives on campus",
    ],
  ),
  Organisation(
    president: "Amanuel Mekuanint",
    name: "Disability Club",
    number_of_students: 50,
    About:
        "The Disability Club at Haramaya University is committed to supporting students with disabilities and underprivileged peers through advocacy, accessibility improvements, food distribution drives, and professional networking to foster an inclusive campus environment.",
    address: "Haramaya University Main Campus, Student Union Building",
    contact: "+251 911 456 789",
    imagepath: "assets/clubs/huda.png",
    actions: [
      "Distributed food and essential supplies to underprivileged students monthly",
      "Organized workshops on disability rights and campus accessibility",
      "Connected members with professionals for career guidance and internships",
      "Advocated for better facilities like ramps and braille resources",
      "Hosted awareness campaigns on inclusive education and mental health",
    ],
  ),
  Organisation(
    president: "Tigist Kebede",
    name: "Entrepreneurship Club",
    number_of_students: 150,
    About:
        "The Entrepreneurship Club at Haramaya University creates a dynamic learning-by-doing environment where students develop entrepreneurial skills through business plan competitions, startup incubators, and mentorship from successful alumni entrepreneurs.",
    address: "Haramaya University Main Campus, Innovation and Enterprise Center",
    contact: "+251 912 567 890",
    imagepath: "assets/clubs/entrepreneurship.png",
    actions: [
      "Launched annual startup pitch competitions with seed funding prizes",
      "Provided mentorship programs pairing students with local business leaders",
      "Conducted workshops on business model canvas and financial literacy",
      "Organized market fairs for student-led product showcases",
      "Collaborated with incubators for real-world venture development",
    ],
  ),
  Organisation(
    president: "Dawit Assefa",
    name: "Environmental Club",
    number_of_students: 120,
    About:
        "The Environmental Club energizes Haramaya University students to protect the planet through tree-planting drives, waste management campaigns, and sustainability education, while engaging the local community in eco-friendly initiatives.",
    address: "Haramaya University Main Campus, Natural Resources Department",
    contact: "+251 911 678 901",
    imagepath: "assets/clubs/environmental.png",
    actions: [
      "Planted over 1,000 trees on campus and surrounding areas annually",
      "Led recycling and plastic-free campus awareness campaigns",
      "Organized eco-treks and wildlife conservation field trips",
      "Conducted seminars on climate change and sustainable agriculture",
      "Partnered with NGOs for river cleanup and biodiversity projects",
    ],
  ),
  Organisation(
    president: "Sara Mohammed",
    name: "HIV/AIDS Awareness Club",
    number_of_students: 80,
    About:
        "This club provides critical education and support on HIV/AIDS prevention, stigma reduction, and health resources at Haramaya University, offering facts, counseling, and activities to empower students and the community.",
    address: "Haramaya University Main Campus, Health and Wellness Center",
    contact: "+251 912 789 012",
    imagepath: "assets/clubs/hiv_aids.png",
    actions: [
      "Distributed educational materials and conducted monthly awareness sessions",
      "Organized voluntary testing drives and counseling referrals",
      "Hosted red ribbon campaigns during World AIDS Day",
      "Developed peer educator training programs for stigma reduction",
      "Collaborated with health NGOs for free condom distribution and talks",
    ],
  ),
  Organisation(
    president: "Bereket Yonas",
    name: "English Club",
    number_of_students: 90,
    About:
        "The English Club enhances language proficiency and cultural exchange at Haramaya University by organizing movie nights, debates, writing contests, and excursions, helping students build confidence in English communication.",
    address: "Haramaya University Main Campus, College of Social Sciences and Humanities",
    contact: "+251 911 890 123",
    imagepath: "assets/clubs/english.png",
    actions: [
      "Screened English films followed by discussion sessions weekly",
      "Hosted debate tournaments on global topics",
      "Organized essay and poetry writing competitions with prizes",
      "Arranged museum visits with English guides and cultural hikes",
      "Facilitated language exchange partnerships with international students",
    ],
  ),
  Organisation(
    president: "Liya Tesfaye",
    name: "Girls' Club (Supported by Action Aid)",
    number_of_students: 70,
    About:
        "Supported by Action Aid, the Girls' Club creates safe forums for female students at Haramaya University to discuss challenges, share experiences, build leadership skills, and promote gender equality through empowerment programs.",
    address: "Haramaya University Main Campus, Women and Youth Affairs Directorate",
    contact: "+251 912 901 234",
    imagepath: "assets/clubs/girls_club.png",
    actions: [
      "Facilitated monthly discussion forums on gender issues and rights",
      "Provided leadership training and mentorship for female students",
      "Organized self-defense and health awareness workshops",
      "Launched campaigns against gender-based violence on campus",
      "Connected members with scholarships and career opportunities for women",
    ],
  ),
  Organisation(
    president: "Nuru Ahmed",
    name: "Charity Club",
    number_of_students: 110,
    About:
        "The Charity Club at Haramaya University focuses on public benefit and relief efforts, organizing fundraisers, donations, and volunteer activities to assist needy individuals in East Hararghe during times of crisis.",
    address: "Haramaya University Main Campus, Community Engagement Office",
    contact: "+251 911 012 345",
    imagepath: "assets/clubs/charity.png",
    actions: [
      "Collected and distributed relief supplies during natural disasters",
      "Raised funds for orphanages and local health clinics",
      "Organized blood donation drives and medical aid campaigns",
      "Volunteered in community food banks and shelter programs",
      "Partnered with international charities for global awareness events",
    ],
  ),
  Organisation(
    president: "Fitsum Getachew",
    name: "Anti-Drug and Alcohol Club",
    number_of_students: 60,
    About:
        "This club works to strengthen awareness against substance abuse at Haramaya University, transforming students through education, counseling, and peer support to promote healthy lifestyles and prevent addiction.",
    address: "Haramaya University Main Campus, Counseling and Guidance Center",
    contact: "+251 912 123 456",
    imagepath: "assets/clubs/anti_drug.png",
    actions: [
      "Conducted anti-drug seminars and awareness rallies quarterly",
      "Developed peer counseling networks for at-risk students",
      "Organized sports events as healthy alternatives to substance use",
      "Distributed educational pamphlets on addiction risks",
      "Collaborated with health services for rehabilitation referrals",
    ],
  ),
  Organisation(
    president: "Meron Solomon",
    name: "Anti-Corruption Club",
    number_of_students: 75,
    About:
        "The Anti-Corruption Club combats bribery and unethical practices through collective action at Haramaya University, focusing on public procurement transparency, ethics training, and advocacy for integrity in student governance.",
    address: "Haramaya University Main Campus, Ethics and Anti-Corruption Office",
    contact: "+251 911 234 567",
    imagepath: "assets/clubs/anti_corruption.png",
    actions: [
      "Monitored and reported procurement irregularities on campus",
      "Hosted ethics workshops and integrity pledge campaigns",
      "Organized debates on corruption's societal impacts",
      "Published student reports on anti-corruption best practices",
      "Advocated for policy changes in university administration",
    ],
  ),
  Organisation(
    president: "Kaleab Tadesse",
    name: "Art and Music Club",
    number_of_students: 85,
    About:
        "The Music Club at Haramaya University nurtures musical talents by teaching instruments, organizing performances, and cultural events, allowing students to explore music individually or in ensembles for creative expression.",
    address: "Haramaya University Main Campus, Cultural and Arts Center",
    contact: "+251 912 345 678",
    imagepath: "assets/clubs/music.png",
    actions: [
      "Offered instrument lessons in guitar, drums, and traditional Ethiopian music",
      "Performed at university cultural festivals and community events",
      "Hosted music composition contests and band formation sessions",
      "Collaborated with local artists for joint performances",
      "Recorded and shared student music tracks online",
    ],
  ),
];
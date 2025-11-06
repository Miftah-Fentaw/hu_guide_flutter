import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final List<FaqItem> FAQs = [
  FaqItem(
    question: "🎓 Why is the Harar and other campuses not included?",
    answer:
        "Currently, HU GUIDE supports only selected campuses due to lack of data integration. We're planning to include Harar and other campuses soon",
  ),
  FaqItem(
    question: "📱 How do I register using the portal or in person?",
    answer:
        "To register online, log into your student portal, go to the 'Registration' section, select your courses, and submit before the deadline. For in-person registration, visit the registrar’s office with your student ID and course selections.",
  ),
  FaqItem(
    question: "🏫 Where can I find study resources?",
    answer:
        "Access resources via the 'Resources' section in UniConnect or browse online here: [University Resource Hub](https://www.universitywebsite.edu/resources). You can filter by college, course, or semester for tailored materials.",
  ),
  FaqItem(
    question: "💬 How do I give feedback?",
    answer:
        "Open the 'Feedback' page from the app menu. Enter your subject and message, then click Submit. All feedback is sent directly to the admin team and reviewed regularly.",
  ),
  FaqItem(
    question: "📅 How can I stay updated with university news?",
    answer:
        "Visit the 'New and Events' page in the app for latest announcements, events, and opportunities. Enable notifications in settings to receive instant updates on important campus activities.",
  ),
  FaqItem(
    question: "👨‍🎓 What’s special for Freshman and GC Students?",
    answer:
        "Freshman students get beginner guides, campus maps, and orientation tips. GC (Graduating Class) students will soon have access to internship listings, thesis templates, and final exam prep materials.",
  ),
  FaqItem(
    question: "❌ The chatbot is not working?",
    answer:
        "If the chatbot is unresponsive, check your internet connection first. If the issue persists, restart the app or contact support via the 'Help & Support' section.",
  ),
  FaqItem(
    question: "💻 How can I contact the developer?",
    answer:
        "You can contact the developer via email at support@uniconnect.edu or open the 'Contact Developer' option in the app to submit feedback directly.",
  ),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children:  [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(CupertinoIcons.arrow_left, color: Colors.white, size: 20)),
                    SizedBox(width: 8),
                    Text(
                      "FAQ & Guides",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Body
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: FAQs.map((faq) => FaqCard(faq: faq)).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqItem {
  final String question;
  final String answer;
  bool isExpanded;

  FaqItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}

class FaqCard extends StatefulWidget {
  final FaqItem faq;
  const FaqCard({Key? key, required this.faq}) : super(key: key);

  @override
  State<FaqCard> createState() => _FaqCardState();
}

class _FaqCardState extends State<FaqCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE0F2FF), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onExpansionChanged: (value) => setState(() => expanded = value),
        trailing: Icon(
          expanded ? Icons.expand_less : CupertinoIcons.rectangle_expand_vertical,
          color: const Color(0xFF0052CC),
        ),
        title: Text(
          widget.faq.question,
          style: const TextStyle(
            color: Color(0xFF0052CC),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              widget.faq.answer,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14.5,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

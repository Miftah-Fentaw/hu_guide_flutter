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
      question: "🎓 Why is the Harar campus not included?",
      answer:
          "To register, log into your student portal, go to the 'Registration' section, and select your preferred courses. Submit before the registration deadline.",
    ),
    FaqItem(
      question: "🎓 How do i register using the portal on in person?",
      answer:
          "To register, log into your student portal, go to the 'Registration' section, and select your preferred courses. Submit before the registration deadline.",
    ),
    FaqItem(
      question: "🏫 Where can I find study resources?",
      answer:
          "You can access all resources in the 'Resources' section of the UniConnect app. Filter by your college or course to find what fits you best.",
    ),
    FaqItem(
      question: "💬 How do I give feedback?",
      answer:
          "Open the Feedback page from the sidebar. Enter your subject and message, then click Submit. Your feedback goes directly to the admin team.",
    ),
    FaqItem(
      question: "📅 How can I stay updated with university news?",
      answer:
          "Visit the News page to see the latest announcements, events, and opportunities. You can also enable notifications for instant updates.",
    ),
    FaqItem(
      question: "👨‍🎓 What’s special for Freshman and GC Students?",
      answer:
          "Freshman students get access to beginner guides and campus tips. GC (Graduating Class) students see internship listings, thesis templates, and final exam prep materials.",
    ),
    FaqItem(
      question: "🎓 The chatbot is not wotking?",
      answer:
          "To register, log into your student portal, go to the 'Registration' section, and select your preferred courses. Submit before the registration deadline.",
    ),
    FaqItem(
      question: "🎓 How can i contact the developer?",
      answer:
          "To register, log into your student portal, go to the 'Registration' section, and select your preferred courses. Submit before the registration deadline.",
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

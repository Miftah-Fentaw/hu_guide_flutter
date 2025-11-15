import 'package:flutter/material.dart';
import 'package:hu_guide/models/colleges_model.dart';
import 'package:hu_guide/models/clubs_model.dart';
import 'package:hu_guide/models/services_model.dart';
import 'package:hu_guide/Screens/%20Colleges%20Screens/College_Detail_Screen.dart';
import 'package:hu_guide/Screens/Clubs%20Screens/Club_Detail_Screen.dart';
import 'package:hu_guide/Screens/srvices%20screens/service_detail_screen.dart';

class Search_Results extends StatefulWidget {
  final String query;
  const Search_Results({super.key, required this.query});

  @override
  State<Search_Results> createState() => _Search_ResultsState();
}

class _Search_ResultsState extends State<Search_Results> {
  late List<SearchResultItem> _results;

  @override
  void initState() {
    super.initState();
    _search();
  }

  void _search() {
    final q = widget.query.toLowerCase();
    _results = [];

    for (var c in colleges) {
      if (c.college_name.toLowerCase().contains(q) ||
          c.short_name.toLowerCase().contains(q) ||
          c.dean.toLowerCase().contains(q)) {
        _results.add(SearchResultItem(
          title: c.college_name,
          subtitle: '${c.short_name} • ${c.dean}',
          icon: Icons.school,
          color: Colors.blue,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CollegeDetailScreen(college: c))),
        ));
      }
    }

    for (var club in clubs) {
      if (club.name.toLowerCase().contains(q) ||
          club.president.toLowerCase().contains(q) ||
          club.actions.any((a) => a.toLowerCase().contains(q))) {
        _results.add(SearchResultItem(
          title: club.name,
          subtitle: '${club.president} • ${club.number_of_students} members',
          icon: Icons.group,
          color: Colors.pink,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ClubDetailScreen(club: club))),
        ));
      }
    }

    for (var s in services) {
      if (s.title.toLowerCase().contains(q) || s.description.toLowerCase().contains(q)) {
        _results.add(SearchResultItem(
          title: s.title,
          subtitle: s.description,
          icon: s.icon,
          color: s.color,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServiceDetailScreen(service: s))),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Search: "${widget.query}"'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _results.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 60, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text('No results found', style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  Text('Try searching for colleges, clubs, or services', style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(width * 0.04),
              itemCount: _results.length,
              itemBuilder: (context, i) {
                final item = _results[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    onTap: item.onTap,
                    leading: CircleAvatar(
                      backgroundColor: item.color.withOpacity(0.2),
                      child: Icon(item.icon, color: item.color),
                    ),
                    title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(item.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            ),
    );
  }
}

class SearchResultItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  SearchResultItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
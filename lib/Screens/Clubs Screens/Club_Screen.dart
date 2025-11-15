import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hu_guide/Screens/Clubs%20Screens/Club_Detail_Screen.dart';
import 'package:hu_guide/models/clubs_model.dart';

class Clubs extends StatefulWidget {
  const Clubs({super.key});

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  final TextEditingController _controller = TextEditingController();
  List<Organisation> _filteredClubs = [];

  @override
  void initState() {
    super.initState();
    _filteredClubs = clubs;
    _controller.addListener(_onSearch);
  }

  void _onSearch() {
    final query = _controller.text.trim().toLowerCase();
    setState(() {
      _filteredClubs = clubs.where((club) {
        return club.name.toLowerCase().contains(query) ||
            club.president.toLowerCase().contains(query) ||
            club.actions.any((action) => action.toLowerCase().contains(query));
      }).toList();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearch);
    _controller.dispose();
    super.dispose();
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final totalMembers = clubs
        .map((club) => club.number_of_students)
        .reduce((a, b) => a + b);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Clubs & Associations',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(CupertinoIcons.xmark),
                    style: IconButton.styleFrom(backgroundColor: Colors.grey.shade200),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Students and university movements, organisations...',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search clubs, associations...',
                  hintStyle: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(CupertinoIcons.search, color: Colors.black54),
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.black54),
                          onPressed: () {
                            _controller.clear();
                            _onSearch();
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  _buildStatCard(context, icon: CupertinoIcons.group_solid, value: clubs.length.toString(), label: 'Clubs'),
                  SizedBox(width: screenWidth * 0.025),
                  _buildStatCard(context, icon: CupertinoIcons.group, value: '5', label: 'Associations'),
                  SizedBox(width: screenWidth * 0.025),
                  _buildStatCard(context, icon: CupertinoIcons.person_2_fill, value: '${totalMembers}+', label: 'Members'),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Clubs & Associations',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Expanded(
                child: _filteredClubs.isEmpty
                    ? const Center(
                        child: Text(
                          'No clubs found',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredClubs.length,
                        itemBuilder: (context, index) {
                          final club = _filteredClubs[index];
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: screenHeight * 0.0125),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(color: Colors.grey.shade200, width: 1.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                  child: Image.asset(
                                    club.imagepath,
                                    height: screenHeight * 0.125,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      height: screenHeight * 0.125,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.group, size: 40),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        club.name,
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.0075),
                                      Text(
                                        club.About,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(CupertinoIcons.group_solid, size: screenWidth * 0.045),
                                              SizedBox(width: screenWidth * 0.01),
                                              Text(
                                                '${club.number_of_students} + members',
                                                style: TextStyle(fontSize: screenWidth * 0.0375),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => ClubDetailScreen(club: club),
                                                ),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.orange.withOpacity(0.3),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.035,
                                                vertical: screenHeight * 0.0075,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Text(
                                              "see more",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black45,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

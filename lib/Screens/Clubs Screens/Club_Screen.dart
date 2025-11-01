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
  final TextEditingController controller = TextEditingController();

  void _onSearchChanged(String value) {}

  void dispose() {
    controller.dispose();
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
        .reduce((value, element) => value + element);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Clubs & Associations',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.grey.shade200,
                        ),
                      ),
                      icon: Icon(CupertinoIcons.xmark, color: Colors.black),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Students and university movements,organisations...',
                    style: TextStyle(fontSize: screenWidth * 0.0375),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: controller,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    label: const Text(
                      'Search clubs,associations...',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: Colors.black54,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildStatCard(
                      context,
                      icon: CupertinoIcons.group_solid,
                      value: clubs.length.toString(),
                      label: 'Clubs',
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                    _buildStatCard(
                      context,
                      icon: CupertinoIcons.group,
                      value: '5',
                      label: 'Association',
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                    _buildStatCard(
                      context,
                      icon: CupertinoIcons.person_2_fill,
                      value: '${totalMembers}+',
                      label: 'Members',
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Clubs & Associations',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Column(
                  children: clubs.asMap().entries.map((entry) {
                    final index = entry.key;
                    final clubs = entry.value;
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        right: screenWidth * 0.0125,
                        bottom: screenHeight * 0.0125,
                      ),
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
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.asset(
                              clubs.imagepath,
                              height: screenHeight * 0.125,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${clubs.name}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0075),
                                Text(
                                  '${clubs.About}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.group_solid,
                                            color: Colors.black,
                                            size: screenWidth * 0.045,
                                          ),
                                          SizedBox(width: screenWidth * 0.01),
                                          Text(
                                            '${clubs.number_of_students} + members',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.0375,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.orange
                                              .withOpacity(0.3),
                                          foregroundColor: Colors.orangeAccent,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.035,
                                            vertical: screenHeight * 0.0075,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ClubDetailScreen(
                                                      club: clubs,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "see more",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

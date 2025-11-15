import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hu_guide/Screens/ Colleges Screens/College_Detail_Screen.dart';
import 'package:hu_guide/models/colleges_model.dart';

class Colleges extends StatefulWidget {
  const Colleges({super.key});

  @override
  State<Colleges> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  final TextEditingController controller = TextEditingController();
  List<College> filteredColleges = [];

  @override
  void initState() {
    super.initState();
    filteredColleges = colleges;
    controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = controller.text.trim().toLowerCase();
    setState(() {
      filteredColleges = colleges.where((college) {
        return college.college_name.toLowerCase().contains(query) ||
            college.short_name.toLowerCase().contains(query) ||
            college.dean.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanged);
    controller.dispose();
    super.dispose();
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
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
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Colleges & Schools',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
                      ),
                      icon: const Icon(CupertinoIcons.xmark, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Explore Academic Colleges',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Search School & Colleges',
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(CupertinoIcons.search, color: Colors.black54),
                    suffixIcon: controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.black54),
                            onPressed: () {
                              controller.clear();
                              _onSearchChanged();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    _buildStatCard(
                      icon: CupertinoIcons.building_2_fill,
                      value: colleges.length.toString(),
                      label: 'Colleges',
                    ),
                    const SizedBox(width: 10),
                    _buildStatCard(
                      icon: CupertinoIcons.person,
                      value: '30k+',
                      label: 'Students',
                    ),
                    const SizedBox(width: 10),
                    _buildStatCard(
                      icon: Icons.school,
                      value: '150+',
                      label: 'Programs',
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                filteredColleges.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: Text(
                            'No colleges found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      )
                    : Column(
                        children: filteredColleges.asMap().entries.map((entry) {
                          final index = entry.key;
                          final college = entry.value;
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
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
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    college.imagepath,
                                    height: 110,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 110,
                                        color: Colors.grey[300],
                                        child: const Icon(Icons.school, size: 40, color: Colors.grey),
                                      );
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${college.college_name} (${college.short_name})',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        college.About,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(CupertinoIcons.group_solid, size: 18),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${college.number_of_students}+ students',
                                                style: const TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => CollegeDetailScreen(college: college),
                                                ),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.orange.withOpacity(0.3),
                                              foregroundColor: Colors.blueAccent,
                                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
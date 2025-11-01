import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hu_guide/models/colleges_model.dart';

class CollegeDetailScreen extends StatelessWidget {
  final College college;

  const CollegeDetailScreen({super.key, required this.college});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            floating: false,
            backgroundColor: Colors.blue.shade800,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                college.college_name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Image.asset(
                college.imagepath,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, "About College"),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      college.About,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildInfoCard(),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "Departments"),
                  const SizedBox(height: 8),
                  _buildDepartmentsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(Icons.person_outline, "Dean", college.dean),
            const Divider(height: 24),
            _buildInfoRow(
              Icons.location_on_outlined,
              "Location",
              college.location,
            ),
            const Divider(height: 24),
            _buildInfoRow(Icons.phone_outlined, "Contact", college.contact),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 20),
        const SizedBox(width: 12),
        Text(
          '$label:',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildDepartmentsList() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: college.departments.map((dept) {
          return ListTile(
            leading: const Icon(CupertinoIcons.paperclip, color: Colors.blue),
            title: Text(dept),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
            },
          );
        }).toList(),
      ),
    );
  }
}

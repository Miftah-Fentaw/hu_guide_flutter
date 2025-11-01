import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('About HU GUIDE'),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/huguide.png', height: 100, width: 100),
            const SizedBox(height: 16),
            const Text(
              'HU GUIDE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Text(
              'Your comprehensive guide to Haramaya University. Explore campus locations, stay updated on events, find services, and connect with the university community all in one place.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
            const SizedBox(height: 32),
            _buildInfoCard(
              context,
              title: 'Developer',
              children: [
                _buildListTile(
                  icon: CupertinoIcons.person_fill,
                  iconColor: Colors.blue,
                  title: 'HU STUDENTS',
                  subtitle: 'Lead Developers',
                  onTap: () => _launchUrl('https://t.me/Miftah_Fentaw'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoCard(
              context,
              title: 'Acknowledgements',
              children: [
                _buildListTile(
                  icon: CupertinoIcons.heart_fill,
                  iconColor: Colors.red,
                  title: 'Flutter',
                  subtitle: 'UI toolkit for building beautiful apps',
                  onTap: () => _launchUrl('https://flutter.dev'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                _buildListTile(
                  icon: CupertinoIcons.map_fill,
                  iconColor: Colors.green,
                  title: 'OpenStreetMap & Mapbox',
                  subtitle: 'For providing map tiles',
                  onTap: () =>
                      _launchUrl('https://www.openstreetmap.org/copyright'),
                ),
                 const Divider(height: 1, indent: 16, endIndent: 16),
                _buildListTile(
                  icon: CupertinoIcons.chat_bubble_fill,
                  iconColor: Colors.blueAccent,
                  title: 'Chtbase.io',
                  subtitle: 'For the integrated AI chatbot',
                  onTap: () =>
                      _launchUrl('https://www.chatbase.io'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              '© 2025 HU GUIDE. All rights reserved.',
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),
            if (onTap != null)
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

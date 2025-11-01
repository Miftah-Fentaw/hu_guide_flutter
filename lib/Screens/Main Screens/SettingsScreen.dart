import 'package:flutter/material.dart';
import 'package:hu_guide/Screens/Main%20Screens/AboutScreen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool pushNotifications = true;
  bool eventReminders = true;
  bool clubUpdates = true;
  bool lostFound = false;
  bool biometricLogin = false;

  Widget buildSettingItem({
    required IconData icon,
    required String title,
    required String description,
    Widget? action,
    VoidCallback? onTap,
  }) {
    final content = Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
            ],
          ),
        ),
        action ?? Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
      ],
    );

    if (action != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: content,
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: content,
      ),
    );
  }

  Widget buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
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
            children: List.generate(items.length * 2 - 1, (i) {
              if (i.isOdd) {
                return Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Colors.grey[200],
                );
              }
              return items[i ~/ 2];
            }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Customize your app experience',
                style: TextStyle(color: Colors.grey[600]),
              ),

              const SizedBox(height: 24),

              buildSection('Appearance', [
                buildSettingItem(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  description: 'Switch between light and dark theme',
                  action: Switch(
                    value: darkMode,
                    activeColor: Colors.blue,
                    onChanged: (val) => setState(() => darkMode = val),
                  ),
                ),
                buildSettingItem(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  description: 'English (US)',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(Icons.info_outline, color: Colors.white),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text('Language selection is coming soon!'),
                            ),
                          ],
                        ),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        backgroundColor: Colors.blue,
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      ),
                    );
                  },
                ),
              ]),

              const SizedBox(height: 24),

              buildSection('Support & About', [
                buildSettingItem(
                  icon: Icons.help_outline,
                  title: 'Help Center',
                  description: 'FAQs and support articles',
                  onTap: () {},
                ),
                buildSettingItem(
                  icon: Icons.info_outline,
                  title: 'About',
                  description: 'Version 1.0.0',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  },
                ),
              ]),

              const SizedBox(height: 24),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Text(
                        'HU GUIDE 1.0.0',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '© 2025 HU GUIDE. All rights reserved.',
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
                    ],
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

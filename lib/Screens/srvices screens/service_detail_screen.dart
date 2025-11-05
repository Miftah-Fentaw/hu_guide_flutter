import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hu_guide/models/services_model.dart';

class ServiceDetailScreen extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(service.title),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: service.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(service.icon, color: service.color, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          service.description,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Service Details'),
            const SizedBox(height: 12),
            _buildInfoCard(
              children: [
                if (service.location != null)
                  _buildDetailRow(
                    icon: CupertinoIcons.location_solid,
                    title: 'Location',
                    value: service.location!,
                  ),
                if (service.hours != null)
                  _buildDetailRow(
                    icon: CupertinoIcons.clock_fill,
                    title: 'Operating Hours',
                    value: service.hours!,
                  ),
                if (service.contact != null)
                  _buildDetailRow(
                    icon: CupertinoIcons.phone_fill,
                    title: 'Contact',
                    value: service.contact!,
                    isContact: true,
                  ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Text(
    title,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );

  Widget _buildInfoCard({required List<Widget> children}) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10),
      ],
    ),
    child: Column(children: children),
  );

  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
    bool isContact = false,
  }) => ListTile(
    leading: Icon(icon, color: Colors.grey[600]),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
    subtitle: Text(
      value,
      style: TextStyle(
        color: isContact ? Colors.blue : Colors.black,
        fontSize: 15,
      ),
    ),
  );
}

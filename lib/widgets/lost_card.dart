// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hu_guide/models/lost_model.dart';

// class LostItemCard extends StatelessWidget {
//   final LostItem item;

//   const LostItemCard({super.key, required this.item});

//   void _callNumber(String phone) async {
//     final uri = Uri.parse('tel:$phone');
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       Fluttertoast.showToast(msg: "Cannot launch dialer");
//     }
//   }

//   void _copyToClipboard(String phone) {
//     Clipboard.setData(ClipboardData(text: phone));
//     Fluttertoast.showToast(msg: "Phone number copied");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         title: Text(item.name,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 4),
//             Text(item.description),
//             const SizedBox(height: 4),
//             Text("Phone: ${item.phone}"),
//           ],
//         ),
//         trailing: Wrap(
//           spacing: 6,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.call, color: Colors.green),
//               onPressed: () => _callNumber(item.phone),
//               tooltip: "Call",
//             ),
//             IconButton(
//               icon: const Icon(Icons.copy, color: Colors.blue),
//               onPressed: () => _copyToClipboard(item.phone),
//               tooltip: "Copy",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hu_guide/models/lost_model.dart';

class LostItemCard extends StatelessWidget {
  final LostItem item;

  const LostItemCard({super.key, required this.item});

  void _callNumber(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Fluttertoast.showToast(msg: "Cannot launch dialer");
    }
  }

  void _copyToClipboard(String phone) {
    Clipboard.setData(ClipboardData(text: phone));
    Fluttertoast.showToast(msg: "Phone number copied");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 360;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: width * 0.04, // Responsive horizontal margin
      ),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.97),
                Colors.white.withOpacity(0.88),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Padding(
              padding: EdgeInsets.all(width * 0.045), // Responsive padding
              child: Row(
                children: [
                  // Gradient Icon Circle
                  Container(
                    width: isSmallScreen ? 48 : 56,
                    height: isSmallScreen ? 48 : 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00C853), Color(0xFF1B5E20)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.35),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.search, color: Colors.white, size: 28),
                  ),

                  SizedBox(width: width * 0.04),

                  // Text Content (Flexible & Responsive)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Item Name
                        Text(
                          item.name,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 15 : 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: width * 0.01),

                        // Description
                        Text(
                          item.description,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 13 : 14,
                            color: Colors.grey[700],
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: width * 0.015),

                        // Phone Row
                        Row(
                          children: [
                            Icon(Icons.phone, size: isSmallScreen ? 14 : 16, color: Colors.green[700]),
                            SizedBox(width: width * 0.015),
                            Expanded(
                              child: Text(
                                item.phone,
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 13.5 : 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[700],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Action Buttons (Call & Copy)
                  Column(
                    children: [
                      _buildActionButton(
                        context: context,
                        icon: Icons.call,
                        color: Colors.green,
                        onTap: () => _callNumber(item.phone),
                        tooltip: "Call",
                      ),
                      SizedBox(height: width * 0.02),
                      _buildActionButton(
                        context: context,
                        icon: Icons.copy,
                        color: Colors.blue,
                        onTap: () => _copyToClipboard(item.phone),
                        tooltip: "Copy",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Responsive & Animated Action Button
  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required String tooltip,
  }) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 360;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: EdgeInsets.all(isSmallScreen ? 7 : 9),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color.withOpacity(0.3), width: 1),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: isSmallScreen ? 18 : 20,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
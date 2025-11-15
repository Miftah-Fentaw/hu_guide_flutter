import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class Resource {
  final String name;
  final String type;
  final String path;

  const Resource({required this.name, required this.type, required this.path});
}

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  final List<Resource> _resources = const [
    Resource(name: "Geography", type: "pdf", path: "assets/resources/geography.pdf"),
    Resource(name: "Maths", type: "pdf", path: "assets/resources/maths.pdf"),
    Resource(name: "Maths Teachers Guide", type: "pdf", path: "assets/resources/maths_teachers_guide.pdf"),
    Resource(name: "Physical Fitness", type: "pdf", path: "assets/resources/physical_fitness.pdf"),
    Resource(name: "Psychology", type: "pdf", path: "assets/resources/psychology.pdf"),
    Resource(name: "Logic", type: "pdf", path: "assets/resources/logic.pdf"),
  ];

  Future<void> _openFile(Resource resource, BuildContext context) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fileName = resource.path.split('/').last;
      final tempFile = File("${tempDir.path}/$fileName");

      final data = await rootBundle.load(resource.path);
      await tempFile.writeAsBytes(data.buffer.asUint8List());

      final result = await OpenFilex.open(tempFile.path);

      if (result.type != ResultType.done) {
        _showToast("Could not open file");
      }

    } catch (e) {
      _showToast("Error opening file: $e");
    }
  }

  void _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    );
  }

  void _browseMore() async {
    const url = "https://example.com/resources";
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Fluttertoast.showToast(msg: "Cannot open browser");
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPad = width * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resources"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: horizontalPad, vertical: 12),
              itemCount: _resources.length,
              itemBuilder: (ctx, i) => ResourceCard(
                resource: _resources[i],
                index: i,
                onTap: () => _openFile(_resources[i], ctx),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPad, vertical: 12),
            child: ElevatedButton.icon(
              onPressed: _browseMore,
              icon: const Icon(Icons.public,color: Colors.white,),
              label: const Text("Browse More",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              backgroundColor: Colors.deepOrangeAccent
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  final Resource resource;
  final int index;
  final VoidCallback onTap;

  const ResourceCard({
    super.key,
    required this.resource,
    required this.index,
    required this.onTap,
  });

  IconData _iconForType(String type) {
    switch (type.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      default:
        return Icons.insert_drive_file;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 360;

    final colors = [
      const Color(0xFF3B82F6),
      const Color(0xFF10B981),
      const Color(0xFFF97316),
      const Color(0xFFEF4444),
    ];
    final gradientColor = colors[index % colors.length];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: width * 0.01),
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
                Colors.white.withOpacity(0.90),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Padding(
              padding: EdgeInsets.all(width * 0.045),
              child: Row(
                children: [
                  Container(
                    width: isSmall ? 48 : 56,
                    height: isSmall ? 48 : 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [gradientColor, gradientColor.withOpacity(0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: gradientColor.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      _iconForType(resource.type),
                      color: Colors.white,
                      size: isSmall ? 26 : 30,
                    ),
                  ),

                  SizedBox(width: width * 0.04),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resource.name,
                          style: TextStyle(
                            fontSize: isSmall ? 15 : 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: width * 0.008),
                        Text(
                          resource.type.toUpperCase(),
                          style: TextStyle(
                            fontSize: isSmall ? 13 : 14,
                            color: gradientColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  _ActionButton(
                    icon: Icons.open_in_new,
                    color: gradientColor,
                    onTap: onTap,
                    tooltip: "Open",
                    isSmall: isSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String tooltip;
  final bool isSmall;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.tooltip,
    required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: EdgeInsets.all(isSmall ? 8 : 10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, size: isSmall ? 19 : 21, color: color),
          ),
        ),
      ),
    );
  }
}

class PdfReaderScreen extends StatelessWidget {
  final String filePath;
  const PdfReaderScreen({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(filePath.split('/').last)),
      body: SfPdfViewer.file(File(filePath)),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:hu_guide/credentials.dart';
import 'package:hu_guide/models/lost_model.dart';
import 'package:hu_guide/widgets/lost_card.dart';

class LostAndFoundScreen extends StatefulWidget {
  const LostAndFoundScreen({super.key});

  @override
  State<LostAndFoundScreen> createState() => _LostAndFoundScreenState();
}

class _LostAndFoundScreenState extends State<LostAndFoundScreen> {
  late Future<List<LostItem>> lostItemsFuture;

  @override
  void initState() {
    super.initState();
    lostItemsFuture = fetchLostItems();
  }

  Future<List<LostItem>> fetchLostItems() async {
    final url =
        lostandfoundkey;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch lost items');
    }

    final csvData = CsvToListConverter().convert(response.body);
    List<LostItem> items = [];

    for (int i = 1; i < csvData.length; i++) {
      final row = csvData[i];
      if (row.length < 4) continue;
      items.add(LostItem.fromCsv(row));
    }

    items.sort((a, b) => b.date.compareTo(a.date));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lost & Found"),
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder<List<LostItem>>(
        future: lostItemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: check your internet'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No lost items found."));
          }

          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return LostItemCard(item: items[index]);
            },
          );
        },
      ),
    );
  }
}

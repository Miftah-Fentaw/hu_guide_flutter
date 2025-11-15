import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import '../models/lost_model.dart';

class LostService {
  final String csvUrl;

  LostService({required this.csvUrl});

  Future<List<LostItem>> fetchLostItems() async {
    final response = await http.get(Uri.parse(csvUrl));

    if (response.statusCode == 200) {
      final List<LostItem> items = [];
      final csvTable = CsvToListConverter().convert(response.body);

      for (int i = 1; i < csvTable.length; i++) {
        final row = csvTable[i];
        if (row.length < 3) continue;
        items.add(LostItem.fromCsv(row));
      }
      return items;
    } else {
      throw Exception('Failed to fetch lost items: ${response.statusCode}');
    }
  }
}

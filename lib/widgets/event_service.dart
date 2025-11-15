import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:hu_guide/models/events_model.dart';

class EventService {
  final String csvUrl;

  EventService({required this.csvUrl});

  Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse(csvUrl));

    if (response.statusCode == 200) {
      List<Event> events = [];
      final csvTable = CsvToListConverter().convert(response.body);

      for (int i = 1; i < csvTable.length; i++) {
        var row = csvTable[i];
        if (row.length < 3) continue;
        events.add(Event.fromCsv(row));
      }
      return events;
    } else {
      throw Exception('Failed to fetch events: ${response.statusCode}');
    }
  }
}

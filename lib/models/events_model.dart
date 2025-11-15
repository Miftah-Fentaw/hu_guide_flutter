class Event {
  final String Title;
  final String Date;
  final String Place;

  Event({required this.Title, required this.Date, required this.Place});

  factory Event.fromCsv(List<dynamic> row) {
    return Event(
      Title: row[0].toString().trim(),
      Date: row[1].toString().trim(),
      Place: row[2].toString().trim(),
    );
  }
}

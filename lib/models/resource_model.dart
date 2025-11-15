class Resource {
  final String name;
  final String type;
  final String path;

  Resource({required this.name, required this.type, required this.path});

  factory Resource.fromCsv(List<dynamic> row) {
    return Resource(
      name: row[0].toString().trim(),
      type: row[1].toString().trim(),
      path: row[2].toString().trim(),
    );
  }
}

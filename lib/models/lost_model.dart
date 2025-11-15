class LostItem {
  final String date;
  final String name;
  final String description;
  final String phone;

  LostItem({
    required this.date,
    required this.name,
    required this.description,
    required this.phone,
  });

  factory LostItem.fromCsv(List<dynamic> row) {
    return LostItem(
      date: row[0].toString().trim(),
      name: row[1].toString().trim(),
      description: row[2].toString().trim(),
      phone: row[3].toString().trim(),
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'name': name,
        'description': description,
        'phone': phone,
      };

  factory LostItem.fromJson(Map<String, dynamic> json) {
    return LostItem(
      date: json['date'],
      name: json['name'],
      description: json['description'],
      phone: json['phone'],
    );
  }
}

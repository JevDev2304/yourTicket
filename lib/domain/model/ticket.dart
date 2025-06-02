class Ticket {
  final int id;
  final String name;
  final String type;
  final DateTime date;
  final String imageUrl;

  Ticket({
    required this.date,
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
  });

  // DateTime.parse(json['date']),
}

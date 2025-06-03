class Ticket {
  final String id;
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

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      name: json['event']['name'],
      type: json['ticketTypeEntity']['name'],
      date: DateTime.parse(json['event']['date']),
      imageUrl: json['event']['image'],
    );
  }
}

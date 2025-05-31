class Event {
  final int id;
  final String name;
  final String imageUrl;
  final String category;
  final DateTime date;
  final String location;
  final String host;
  final String description;

  Event({
    required this.date,
    required this.category,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.host,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      category: json['category'],
      host: json['host'],
      date: DateTime.parse(json['date']),
      description: json['description'],
      imageUrl: json['image'],
    );
  }
}

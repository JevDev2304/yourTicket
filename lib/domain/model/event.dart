class Event {
  final int id;
  final String name;
  final String imageUrl;
  final String category;
  final DateTime date;
  final String location;
  final String host;

  Event({
    required this.date,
    required this.category,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.host,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      category: json['category'],
      host: json['host'],
      date: json['date'],
      imageUrl: json['image'],
    );
  }
}

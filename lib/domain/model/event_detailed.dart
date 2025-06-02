class EventDetailed {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final DateTime date;
  final String host;
  final String hostPictureUrl;
  // final int price;
  // final String city;
  final String address;

  EventDetailed({
    required this.date,
    required this.category,
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.host,
    required this.hostPictureUrl,
    // required this.price,
    // required this.city,
    required this.address,
  });

  factory EventDetailed.fromJson(Map<String, dynamic> json) {
    return EventDetailed(
      date: DateTime.parse(json['date']),
      category: json['category']['name'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image'],
      host: json['host'],
      hostPictureUrl: json['host_image'],
      address: json['location'],
    );
  }
}

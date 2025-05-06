class EventDetailed {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final DateTime date;
  final String host;
  final String hostPictureUrl;
  final int price;
  final String city;
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
    required this.price,
    required this.city,
    required this.address,
  });
}

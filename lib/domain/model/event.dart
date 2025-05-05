class Event {
  final int id;
  final String name;
  final String imageUrl;
  final String category;
  final DateTime date;

  Event({
    required this.date,
    required this.category,
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

class TicketDetailed {
  final int id;
  final String name;
  final String category;
  final String qrImageUrl;
  final DateTime date;
  final String code;
  final String city;
  final String address;
  final String type;
  final DateTime purchasedOn;

  TicketDetailed({
    required this.date,
    required this.id,
    required this.name,
    required this.category,
    required this.qrImageUrl,
    required this.code,
    required this.city,
    required this.address,
    required this.type,
    required this.purchasedOn,
  });
}

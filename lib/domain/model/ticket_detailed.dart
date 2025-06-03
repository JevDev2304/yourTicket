class TicketDetailed {
  final String id;
  final String name;
  final String category;
  final String qrImageUrl;
  final DateTime date;
  final String code;
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
    required this.address,
    required this.type,
    required this.purchasedOn,
  });

  factory TicketDetailed.fromJson(Map<String, dynamic> json) {
    return TicketDetailed(
      date: DateTime.parse(json['event']['date']),
      id: json['id'],
      name: json['event']['name'],
      category: json['event']['category']['name'],
      qrImageUrl:
          "https://api.qrserver.com/v1/create-qr-code/?data=${json['id']}",
      code: json['id'],
      address: json['event']['location'],
      type: json['ticketTypeEntity']['name'],
      purchasedOn: DateTime.parse(json['purchaseDate']),
    );
  }
}

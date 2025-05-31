class TicketType {
  final String name;
  final int quantity;

  TicketType({required this.name, required this.quantity});

  factory TicketType.fromJson(Map<String, dynamic> json) {
    return TicketType(name: json['name'], quantity: json['quantity']);
  }
}

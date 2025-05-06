class Ticket {
  final int id;
  final String name;
  final DateTime date;
  final String code;
  final int numberOfTickets;

  Ticket({
    required this.date,
    required this.id,
    required this.name,
    required this.code,
    required this.numberOfTickets,
  });
}

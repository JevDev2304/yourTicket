class TicketDetailed {
  final int id;
  final String name;
  final String type;
  final String ticketHolderName;
  final DateTime date;
  final String imageUrl; 

  TicketDetailed({
    required this.date,
    required this.id,
    required this.name,
    required this.type,
    required this.ticketHolderName,
    required this.imageUrl, 
  });
}

class TicketAvailability {
  final int basic;
  final int preferred;
  final int vip;

  TicketAvailability({
    required this.basic,
    required this.preferred,
    required this.vip,
  });

  factory TicketAvailability.fromJson(Map<String, dynamic> json) {
    return TicketAvailability(
      basic: json['basicTicketsAvailable'],
      preferred: json['preferredTicketsAvailable'],
      vip: json['vipTicketsAvailable'],
    );
  }
}

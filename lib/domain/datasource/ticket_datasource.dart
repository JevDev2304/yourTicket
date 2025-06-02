import 'package:tickets_app/domain/model/ticket.dart';
import 'package:tickets_app/domain/model/ticket_detailed.dart';

abstract class TicketDatasource {
  Future<List<Ticket>?> fetchUserTickets(String username);
  Future<TicketDetailed?> fetchTicketDetail(String id);
  Future<void> payment(String email, String eventId, String ticketType);
}

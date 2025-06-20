import 'package:tickets_app/domain/datasource/ticket_datasource.dart';
import 'package:tickets_app/domain/model/ticket.dart';
import 'package:tickets_app/domain/model/ticket_availability.dart';
import 'package:tickets_app/domain/model/ticket_detailed.dart';

class TicketRepository {
  final TicketDatasource _ticketDatasource;

  TicketRepository(this._ticketDatasource);

  Future<List<Ticket>?> getUserTickets(String username) {
    return _ticketDatasource.fetchUserTickets(username);
  }

  Future<TicketDetailed?> getTicketDetail(String id) {
    return _ticketDatasource.fetchTicketDetail(id);
  }

  Future<void> payment(String email, String eventId, String ticketType) {
    return _ticketDatasource.payment(email, eventId, ticketType);
  }

  Future<TicketAvailability?> getTicketAvailability(String eventId) {
    return _ticketDatasource.fetchTicketAvailability(eventId);
  }
}

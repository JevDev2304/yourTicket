import 'package:tickets_app/domain/datasource/ticket_datasource.dart';
import 'package:tickets_app/domain/model/ticket.dart';
import 'package:tickets_app/domain/model/ticket_detailed.dart';

class TicketApiDatasource extends TicketDatasource {
  @override
  Future<TicketDetailed?> fetchTicketDetail(String id) {
    // TODO: implement fetchTicketDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Ticket>?> fetchUserTickets(String username) {
    // TODO: implement fetchUserTickets
    throw UnimplementedError();
  }

  @override
  Future<void> payment() {
    // TODO: implement payment
    throw UnimplementedError();
  }
}

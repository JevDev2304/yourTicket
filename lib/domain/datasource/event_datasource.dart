import 'package:tickets_app/domain/model/category.dart';
import 'package:tickets_app/domain/model/event.dart';
import 'package:tickets_app/domain/model/event_detailed.dart';
import 'package:tickets_app/domain/model/ticket_type.dart';

abstract class EventDatasource {
  Future<List<Event>?> fetchEventList();
  Future<List<Event>?> fetchEventByName(String name);
  Future<List<Event>?> fetchEventByCategory(String category);
  Future<EventDetailed?> fetchEventDetails(int ticketId);
  Future<List<Category>?> fetchEventCategories();
  Future<List<TicketType>?> fetchEventTicketTypes(int eventId);
}
